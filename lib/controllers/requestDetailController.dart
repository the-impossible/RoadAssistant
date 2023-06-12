import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/request_details.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/utils/loading.dart';

class RequestDetailController extends GetxController {
  RequestDetails? requestDetails;
  String? requestID;

  processGetRequest() async {
    Get.showOverlay(
        asyncFunction: () => getRequestDetails(),
        loadingWidget: const Loading());
  }

  Future<void> getRequestDetails() async {
    TokenController tokenController = Get.put(TokenController());
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.getRequest + requestID!);

      var request = http.MultipartRequest('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        requestDetails = requestDetailsFromJson(await response.stream.bytesToString());

        Get.toNamed(Routes.complete_taskPage);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Error: ", false));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
