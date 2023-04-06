
import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';
import 'package:welcome/constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Notification',
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10.0,
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 10.0,
                  ),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Notification',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Schyuler',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: kDarkColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 400,
            height: 300,
            margin: const EdgeInsets.all(kFixedPadding),
            padding: const EdgeInsets.all(kFixedPadding),
            decoration: const BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: kDarkColor,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              children: [Text('data'),],
            ),
          ),
        ],
      ),
    );
  }
}
