// import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/token.dart';
import 'package:welcome/models/user_profile.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:welcome/utils/loading.dart';
import 'package:welcome/utils/preferences.dart';
// import 'package:welcome/utils/preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProfile? userProfile;
  Preferences preferences = Preferences();

  verifyLogin() async {
    Get.showOverlay(
        asyncFunction: () => signIn(), loadingWidget: const Loading());
  }

  Future<void> signIn() async {
    TokenController tokenController = Get.put(TokenController());

    try {
      var request = http.MultipartRequest('POST',
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.signIn));

      request.fields.addAll({
        'email': emailController.text.toLowerCase(),
        'password': passwordController.text
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        tokenController.token =
            tokenFromJson(await response.stream.bytesToString());
        ProfileController profileController = Get.put(ProfileController());
        profileController.onInit();
        emailController.clear();
        passwordController.clear();
      } else {

        ScaffoldMessenger.of(Get.context!).showSnackBar(
            customSnackBar("Error: ${response.reasonPhrase}", false));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
