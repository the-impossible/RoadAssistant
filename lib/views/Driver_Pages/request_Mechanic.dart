import 'package:flutter/material.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/utils/constant.dart';


class Request_Mechanic extends StatefulWidget {
  const Request_Mechanic({super.key});

  @override
  State<Request_Mechanic> createState() => _Request_MechanicState();
}

class _Request_MechanicState extends State<Request_Mechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Request for Mechanic',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: kGreyColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: kDarkColor,
                blurRadius: 5.0,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/profile.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Faisol Ademola',
                style: TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: kDarkColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'No. 33, Rock Road Oppsite PolyGate Hotel',
                style: TextStyle(
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
              const Text(
                '5km far from your current location',
                style: TextStyle(
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
              const Text(
                '08089576736',
                style: TextStyle(
                  fontFamily: 'Schyuler',
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: kLightColor,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kOrangeColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: kWhiteColor,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kOrangeColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                          ),
                        )),
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
