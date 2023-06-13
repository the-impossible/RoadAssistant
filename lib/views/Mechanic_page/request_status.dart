import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/approveRequestController.dart';
import 'package:welcome/controllers/cancelrequestController.dart';
import 'package:welcome/controllers/mecRequestDetailController.dart';
import 'package:welcome/utils/constant.dart';

class RequestStatusPAGE extends StatefulWidget {
  const RequestStatusPAGE({super.key});

  @override
  State<RequestStatusPAGE> createState() => _RequestStatusPAGEState();
}

class _RequestStatusPAGEState extends State<RequestStatusPAGE> {
  MecRequestDetailController mecRequestDetailController =
      Get.put(MecRequestDetailController());

  ApproveRequestController approveRequestController =
      Get.put(ApproveRequestController());

  CancelRequestController cancelRequestController =
      Get.put(CancelRequestController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Request Status',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Container(
          height: 400,
          width: size.width,
          decoration: BoxDecoration(
            color: kGreyColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: kDarkColor,
                blurRadius: 5,
                // spreadRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 228, 236, 230),
                  maxRadius: 50,
                  minRadius: 50,
                  child: ClipOval(
                    child: Image.memory(
                      mecRequestDetailController.requestDetails!.image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                mecRequestDetailController.requestDetails!.driverName,
                style: const TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                mecRequestDetailController.requestDetails!.driverPhone,
                style: const TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${mecRequestDetailController.requestDetails!.distance}km far from you',
                softWrap: true,
                style: const TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (mecRequestDetailController.requestDetails!.approved)
                    ? 'Approved'
                    : (mecRequestDetailController.requestDetails!.pending)
                        ? 'Pending'
                        : 'Canceled',
                softWrap: true,
                style: const TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        approveRequestController.requestID =
                            mecRequestDetailController
                                .requestDetails!.requestId;
                        approveRequestController.processApproveRequest();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kOrangeColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                      child: const Text(
                        'Accept',
                        style: TextStyle(
                          color: kDarkColor,
                          fontSize: 20.0,
                          fontFamily: 'Schyuler',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        cancelRequestController.is_driver = false;
                        cancelRequestController.requestID =
                            mecRequestDetailController
                                .requestDetails!.requestId;
                        cancelRequestController.processCancelRequest();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kOrangeColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                      child: const Text(
                        'Reject',
                        style: TextStyle(
                          color: kDarkColor,
                          fontSize: 20.0,
                          fontFamily: 'Schyuler',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
