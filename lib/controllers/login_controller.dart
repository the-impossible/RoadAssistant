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
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.signIn);

      Map body = {
        'email': emailController.text.toLowerCase(),
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      // var request = http.MultipartRequest('POST', url);

      // request.fields.addAll({
      //   'email': emailController.text.toLowerCase(),
      //   'password': passwordController.text,
      // });

      // http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        tokenController.token = tokenFromJson(response.body);
        print("Login Response: ${tokenController.token}");

        ProfileController profileController = Get.put(ProfileController());
        print(profileController);
        profileController.onInit();
        emailController.clear();
        passwordController.clear();
      } else {
        // print(response.reasonPhrase);
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
