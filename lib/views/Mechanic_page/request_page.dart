import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/mecRequestDetailController.dart';
import 'package:welcome/controllers/receiveRequestController.dart';
import 'package:welcome/models/mecRequest.dart';
import 'package:welcome/utils/constant.dart';
import '../../routes/routes.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  ReceiveRequestController receiveRequestController =
      Get.put(ReceiveRequestController());

  MecRequestDetailController mecRequestDetailController =
      Get.put(MecRequestDetailController());

  final StreamController<List<MecRequest>?> _streamController =
      StreamController();

  Future<List<MecRequest>?> _getRequest() async {
    List<MecRequest>? att = await receiveRequestController.receiveRequest();
    _streamController.sink.add(att);
  }

  void processRequest() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (mounted) {
        setState(() {
          _getRequest();
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Driver Request',
        child: DefaultBackButton(),
      ),
      body: StreamBuilder<List<MecRequest>?>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is loading
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // If an error occurred
              return Center(
                child: Text(
                  'ERROR: ${snapshot.error}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Schuyler',
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              List<MecRequest> mecRequest = snapshot.data!;

              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: mecRequest.length,
                itemBuilder: (context, index) {
                  final mecData = mecRequest[index];

                  return ListTile(
                    leading: const Icon(Icons.notifications_active_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: Text(
                      mecData.driverName,
                      style: const TextStyle(color: kDarkColor, fontSize: 20),
                    ),
                    subtitle: Text(
                      "${mecData.distance} km far away",
                      style: const TextStyle(color: kLightColor, fontSize: 15),
                    ),
                    onTap: () {
                      mecRequestDetailController.requestID = mecData.requestId;
                      mecRequestDetailController.processGetRequest();
                    },
                    enabled: true,
                  );
                },
              );
            } else {
              // If there is no data available
              return const Center(
                child: Text(
                  'No data available!',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Schuyler',
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
              );
            }
          }),
    );
  }
}
