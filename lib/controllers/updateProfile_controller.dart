import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/user_profile.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:welcome/utils/loading.dart';

class UpdateProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();
  TextEditingController shopController = TextEditingController();

  File? image;
  String? userId;

  verifyUpdateAccount() async {
    Get.showOverlay(
        asyncFunction: () => updateAccount(), loadingWidget: const Loading());
  }

  Future<void> updateAccount() async {
    TokenController tokenController = Get.put(TokenController());
    ProfileController profileController = Get.put(ProfileController());

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(APIEndPoints.baseURL +
          APIEndPoints.authEndPoints.updateProfile +
          userId!);

      var request = http.MultipartRequest('PUT', url);

      request.fields.addAll({
        'name': nameController.text,
        'biz_name': businessNameController.text,
        'shop_address': shopController.text,
        'lat': latController.text,
        'lon': lonController.text,
        'is_mec': profileController.userProfile!.is_mec.toString(),
        'phone': phoneController.text,
        'email': emailController.text
      });

      if (image?.path != null) {
        request.files
            .add(await http.MultipartFile.fromPath('pic', image!.path));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String output = "Profile Updated Successfully";
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar(output, true));

        profileController.getProfile();

        Get.back();

        // Get.offNamed(Routes.mecHomePage);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            customSnackBar(response.reasonPhrase.toString(), false));
      }
    } catch (e) {
      String output = "FAILED: $e";
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar(output, false));
    }
  }
}
