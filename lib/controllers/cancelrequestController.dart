import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/get_mec.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/customFunction.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/utils/loading.dart';

class CancelRequestController extends GetxController {
  String? requestID;

  processCancelRequest() async {
    Get.showOverlay(
        asyncFunction: () => cancelPendingRequest(),
        loadingWidget: const Loading());
  }

  Future<void> cancelPendingRequest() async {
    TokenController tokenController = Get.put(TokenController());

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.cancelRequest);

      var request = http.MultipartRequest('GET', url);

      request.fields.addAll({
        'request_id': requestID!,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Request has been cancelled", true));
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Cancel request failed!", false));
        Get.offNamed(Routes.taskPage);
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
