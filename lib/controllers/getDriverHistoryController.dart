import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/driver_history.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class GetDriverHistoryController extends GetxController {
  List<DriverHistory>? driverHistory;

  Future<List<DriverHistory>?> getHistory() async {
    TokenController tokenController = Get.put(TokenController());

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.getDriverHistory);

      var request = http.MultipartRequest('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {

        driverHistory =
            driverHistoryFromJson(await response.stream.bytesToString());

        if (driverHistory!.isEmpty) {
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(customSnackBar("No Data Available", false));
        }

        return driverHistory;
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            customSnackBar("Error: ${response.reasonPhrase}", false));
        return [];
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
      return [];
    }
  }
}
