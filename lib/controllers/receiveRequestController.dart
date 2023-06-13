import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/mecRequest.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/utils/loading.dart';

class ReceiveRequestController extends GetxController {
  List<MecRequest>? mecRequest;
  String? mecID;

  Future<List<MecRequest>?> receiveRequest() async {
    TokenController tokenController = Get.put(TokenController());

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokenController.token!.access}'
      };

      var url = Uri.parse(
          APIEndPoints.baseURL + APIEndPoints.authEndPoints.mecRequest);

      var request = http.MultipartRequest('GET', url);

      request.fields.addAll({
        'mec_id': mecID!,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        mecRequest = mecRequestFromJson(await response.stream.bytesToString());

        if (mecRequest!.isEmpty) {
          return [];
        }
        return mecRequest;
      } else {
        return [];
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
      return [];
    }
  }
}
