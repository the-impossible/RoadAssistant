import 'package:flutter/material.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/utils/constant.dart';

class RequestStatusPAGE extends StatefulWidget {
  const RequestStatusPAGE({super.key});

  @override
  State<RequestStatusPAGE> createState() => _RequestStatusPAGEState();
}

class _RequestStatusPAGEState extends State<RequestStatusPAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Request Status',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
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
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 100,
                ),
              ),
              const Text(
                'Mr. Ibrahim Yahaya',
                style: TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Send a request for mechanic, his 5km far from you',
                style: TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 50.0),
                    child: Container(
                      height: 60,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kOrangeColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
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
                  ),
                  Container(
                    height: 60,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {},
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
