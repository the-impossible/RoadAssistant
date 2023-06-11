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

class RequestMecController extends GetxController {
  String? driverID;
  String? mecID;

  processPendingRequest() async {
    Get.showOverlay(
        asyncFunction: () => verifyPendingRequest(),
        loadingWidget: const Loading());
  }

  Future<void> requestMec() async {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    TokenController tokenController = Get.put(TokenController());
    Position position = await determinePosition();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.requestAMec);

      var request = http.MultipartRequest('POST', url);

      request.fields.addAll({
        'driver_id': driverID!,
        'mec_id': mecID!,
        'lon': position.longitude.toString(),
        'lat': position.latitude.toString(),
        'pending': 'true',
        'approved': 'false'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      navigator!.pop(Get.context!);

      if (response.statusCode == 201) {
        Get.toNamed(Routes.taskPage);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            customSnackBar("Error: ${response.reasonPhrase} ", false));
      }
    } catch (e) {
      navigator!.pop(Get.context!);

      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }

  Future<void> verifyPendingRequest() async {
    TokenController tokenController = Get.put(TokenController());

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.verifyRequest);

      var request = http.MultipartRequest('GET', url);

      request.fields.addAll({
        'driver_id': driverID!,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        requestMec();
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(customSnackBar(
            "Cancel pending request or wait for mechanic approval", false));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    }
  }
}
