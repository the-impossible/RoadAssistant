import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/constant.dart';

import '../routes/routes.dart';

class MecHomePage extends StatefulWidget {
  const MecHomePage({super.key});

  @override
  State<MecHomePage> createState() => _MecHomePageState();
}

class _MecHomePageState extends State<MecHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccenstColor,
      appBar: const DefaultAppBar(
        title: 'DASHBOARD',
        // child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(color: kShow),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 10.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Hey',
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: kFriendlyColor,
                              ),
                            ),
                            Text(
                              'Welcome !!!',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontStyle: FontStyle.italic,
                                fontSize: 25,
                                color: kShow,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 100,
                    margin: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(kRadius),
                      boxShadow: const [
                        BoxShadow(color: kLightColor, blurRadius: 3.0),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'BeeJay',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kFriendlyColor,
                          ),
                        ),
                        Image.asset(
                          'assets/images/profile.png',
                          height: 40,
                          width: 40,
                          // alignment: Alignment.topRight,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 06.0)),
            Container(
              height: 500,
              margin: const EdgeInsets.only(
                  top: 20.0, right: 15.0, left: 15.0, bottom: 15.0),
              padding: EdgeInsets.all(kFixedPadding),
              decoration: BoxDecoration(
                color: kWhiteColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(kRadius),
                boxShadow: const [
                  BoxShadow(color: kLightColor, blurRadius: 3.0),
                ],
              ),
              child: Container(
                width: 500,
                height: 260,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.0),
                      width: 450,
                      height: 120,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: kLessPadding),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: kLightColor, style: BorderStyle.solid),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          Get.toNamed(Routes.updatePage),
                        },
                        child: Text(
                          "Please upload your information".toUpperCase(),
                          style: const TextStyle(
                            color: kFriendlyColor,
                            fontSize: 17.0,
                            fontFamily: 'Schuyler',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30.0),
                      width: 450,
                      height: 100,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: kLessPadding),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: kLightColor, style: BorderStyle.solid),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          Get.toNamed(Routes.requestPage),
                        },
                        child: Text(
                          "Check for available request".toUpperCase(),
                          style: const TextStyle(
                            color: kFriendlyColor,
                            fontSize: 17.0,
                            fontFamily: 'Schuyler',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30.0),
                      width: 450,
                      height: 100,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: kLessPadding),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: kLightColor, style: BorderStyle.solid),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          Get.toNamed(Routes.notificationList),
                        },
                        child: Text(
                          "Check All FeedBack".toUpperCase(),
                          style: const TextStyle(
                            color: kFriendlyColor,
                            fontSize: 17.0,
                            fontFamily: 'Schuyler',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30.0),
                      width: 450,
                      height: 100,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: kLessPadding),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: kLightColor, style: BorderStyle.solid),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          Get.toNamed(Routes.mecProfilePage),
                        },
                        child: Text(
                          "My Account".toUpperCase(),
                          style: const TextStyle(
                            color: kFriendlyColor,
                            fontSize: 17.0,
                            fontFamily: 'Schuyler',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
