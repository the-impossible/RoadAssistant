import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/utils/constant.dart';
import 'package:welcome/routes/routes.dart';

class Help_Page extends StatefulWidget {
  const Help_Page({super.key});

  @override
  State<Help_Page> createState() => _Help_PageState();
}

class _Help_PageState extends State<Help_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Help Center',
        child: DefaultBackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 10.0),
            child: const Text(
              'Get Help',
              style: TextStyle(
                fontFamily: 'Schuyler',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(
                  top: 30.0, left: 10.0, bottom: 20.0, right: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                color: kWhiteColor,
                boxShadow: const [
                  BoxShadow(color: kDarkColor, blurRadius: 1.0),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.driverPage);
                    },
                    child: Image.asset(
                      'assets/images/whatsapp.jpg',
                      height: 400,
                      width: 100,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.driverPage);
                    },
                    child: Image.asset(
                      'assets/images/telegram.png',
                      height: 100,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,
                            'https://web.facebook.com/olamide.olaguy.3');
                      },
                      child: Image.asset('assets/images/facebook.png'))
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: const Text(
                  'Customer Service Numbers',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0),
          ),
          const Text(
            '  +234 7044 4772 210',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '  +234 7044 4772 210',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            '  +234 7044 4772 210',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            '  +234 7044 4772 210',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
