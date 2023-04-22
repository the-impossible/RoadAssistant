import 'package:flutter/material.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'About Page',
        child: DefaultBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height * .8,
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text(
                    textAlign: TextAlign.center,
                    'ROAD VEHICLES BREAKDOWN ASSISTANT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 9,
                    child: Text(
                      'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                      style: TextStyle(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    style: TextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    style: TextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A smartphone app called On Road Vehicle Breakdown Assistance makes it simple for drivers and mechanics to communicate with one another through automation. When a motorist is going and their car breaks down or they are in an accident, it helps them to alleviate their tension by assisting them in finding the closest mechanic shop nearby.',
                    style: TextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
