import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/user_profile.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:welcome/utils/loading.dart';

class ProfileController extends GetxController {
  UserProfile? userProfile;

  @override
  void onInit() {
    super.onInit();
    Get.showOverlay(
        asyncFunction: () => getProfile(), loadingWidget: const Loading());
  }

  var isLoading = false.obs;

  Future<void> getProfile() async {
    TokenController tokenController = Get.put(TokenController());
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.profile);

      var request = http.MultipartRequest('get', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        userProfile =
            userProfileFromJson(await response.stream.bytesToString());
        isLoading(true);

        // Check user type and route
        Get.offNamed(Routes.mecHomePage);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Error: ", false));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    } finally {
      isLoading(false);
    }
  }
}
