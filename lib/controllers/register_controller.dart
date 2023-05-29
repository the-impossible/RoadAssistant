// import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:welcome/utils/loading.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? userType;

  verifyCreateAccount() async {
    Get.showOverlay(
        asyncFunction: () => createAccount(), loadingWidget: const Loading());
  }

  Future<void> createAccount() async {
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.signUp));

      request.fields.addAll({
        'email': emailController.text.toLowerCase(),
        'name': nameController.text,
        'phone': phoneController.text,
        'is_mec': (userType! == 'Driver') ? 'false' : 'true',
        'password': passwordController.text,
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        emailController.clear();
        nameController.clear();
        phoneController.clear();
        passwordController.clear();

        ScaffoldMessenger.of(Get.context!).showSnackBar(
            customSnackBar("Account created successfully!", true));
        Get.offNamed(Routes.login);
      } else {
        String output = "";
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        jsonResponse.forEach((key, value) {
          if (value is List) {
            List<dynamic> valueList = value;
            if (valueList.isNotEmpty) {
              String cleanValue = valueList[0]
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '');
              output += "$cleanValue\n";
            }
          }
        });
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Error: $output", false));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
