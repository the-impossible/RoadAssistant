import 'dart:math';
import 'package:flutter/material.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/utils/constant.dart';


class Complete_task extends StatefulWidget {
  const Complete_task({super.key});

  @override
  State<Complete_task> createState() => _Complete_taskState();
}

class _Complete_taskState extends State<Complete_task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Completed Tasks',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: kGreyColor,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: kDarkColor,
                blurRadius: 5.0,
                offset: Offset(0, 1),
                spreadRadius: sqrt1_2,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  height: 100,
                  width: 100,
                ),
                const Text(
                  'Faisol Ademola',
                  style: TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
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
                const Divider(
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Request Status:',
                        style: TextStyle(
                          fontFamily: 'Schyuler',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Schyuler',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Request Date:',
                          style: TextStyle(
                            fontFamily: 'Schyuler',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Text('10/02.2023')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
