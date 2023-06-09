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

class GetMecController extends GetxController {
  GetMec? mec;
  String? userID;

  processGetNearbyMechanic() async {
    Get.showOverlay(
        asyncFunction: () => getNearbyMechanic(),
        loadingWidget: const Loading());
  }

  Future<GetMec?> getNearbyMechanic() async {
    TokenController tokenController = Get.put(TokenController());

    Position position = await determinePosition();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.getAMec + userID!);

      var request = http.MultipartRequest('GET', url);

      request.fields.addAll({
        'lon': position.longitude.toString(),
        'lat': position.latitude.toString(),
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        mec = getMecFromJson(await response.stream.bytesToString());

        Get.toNamed(Routes.request_mechanic);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Error: ", false));
        return null;
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
      return null;
    }
  }
}
