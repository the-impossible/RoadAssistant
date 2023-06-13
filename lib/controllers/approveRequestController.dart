import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/utils/loading.dart';

class ApproveRequestController extends GetxController {
  String? requestID;

  processApproveRequest() async {
    Get.showOverlay(
        asyncFunction: () => approvePendingRequest(),
        loadingWidget: const Loading());
  }

  Future<void> approvePendingRequest() async {
    TokenController tokenController = Get.put(TokenController());

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.approveRequest);

      var request = http.MultipartRequest('GET', url);

      request.fields.addAll({
        'request_id': requestID!,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Request has been Approved", true));
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Unable to approve request!", false));
        Get.offNamed(Routes.taskPage);
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
