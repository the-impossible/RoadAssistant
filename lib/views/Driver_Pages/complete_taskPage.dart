import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/cancelrequestController.dart';
import 'package:welcome/controllers/requestDetailController.dart';
import 'package:welcome/utils/constant.dart';

class Complete_task extends StatefulWidget {
  const Complete_task({super.key});

  @override
  State<Complete_task> createState() => _Complete_taskState();
}

class _Complete_taskState extends State<Complete_task> {
  RequestDetailController requestDetailController =
      Get.put(RequestDetailController());
  CancelRequestController cancelRequestController =
      Get.put(CancelRequestController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime localDateTime =
        requestDetailController.requestDetails!.dateRequested;
    String requestDate =
        "${localDateTime.year}-${localDateTime.month}-${localDateTime.day}";

    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Request Status',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Container(
          height: (requestDetailController.requestDetails!.approved)
              ? size.height * .5
              : size.height * .6,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kWhiteColor,
            boxShadow: const [
              BoxShadow(
                  color: kLightColor, blurRadius: 1.0, offset: Offset(1, 3)),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 228, 236, 230),
                  maxRadius: 50,
                  minRadius: 50,
                  child: ClipOval(
                    child: Image.memory(
                      requestDetailController.requestDetails!.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  requestDetailController.requestDetails!.bizName,
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  requestDetailController.requestDetails!.shopAddress,
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: kLightColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${requestDetailController.requestDetails!.distance}km far from your current location',
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: kLightColor,
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Request Status: ',
                      style: TextStyle(
                        fontFamily: 'Schyuler',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      (requestDetailController.requestDetails!.approved)
                          ? 'Completed'
                          : 'Pending',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Schyuler',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Request Date: ',
                          style: TextStyle(
                            fontFamily: 'Schyuler',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      requestDate,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Schyuler',
                      ),
                    ),
                  ],
                ),
                (requestDetailController.requestDetails!.approved)
                    ? const Text('')
                    : Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * .07,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kFriendlyColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              cancelRequestController.requestID =
                                  requestDetailController
                                      .requestDetails!.requestId;
                              cancelRequestController.processCancelRequest();
                            },
                            child: const Text(
                              'Cancel Assistance',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
