import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/nearby_mec.dart';
import 'package:welcome/utils/customFunction.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:welcome/utils/loading.dart';
import 'package:http/http.dart' as http;

class GetNearbyMecController extends GetxController {
  List<NearbyMechanic>? nearbyMechanic;

  Future<List<NearbyMechanic>?> getNearbyMechanic() async {
    TokenController tokenController = Get.put(TokenController());

    Position position = await determinePosition();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.getMec);

      var request = http.MultipartRequest('GET', url);

      request.fields.addAll({
        'lon': position.longitude.toString(),
        'lat': position.latitude.toString(),
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        nearbyMechanic =
            nearbyMechanicFromJson(await response.stream.bytesToString());

        if (nearbyMechanic!.isEmpty) {
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(customSnackBar("No Data Available", false));
        }
        return nearbyMechanic;
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Error: ", false));
        return [];
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
      return [];
    }
  }
}
