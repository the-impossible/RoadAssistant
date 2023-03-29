import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/constant.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const[
                      BoxShadow(color: kShow),
                    ],
                  ),
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Hey',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          color: kShow,
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
                ),
                Container(
                  width: 500,
                  height: 80,
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
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 40.0),
                  width: 450,
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
                      Navigator.pushNamed(context, '/Update_Page'),
                    },
                    child: Text(
                      "Please upload your information".toUpperCase(),
                      style: const TextStyle(
                        color: kFriendlyColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  width: 450,
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
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/request_page')},
                    child: Text(
                      "Check for available request".toUpperCase(),
                      style: const TextStyle(
                        color: kFriendlyColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  width: 450,
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
                      Navigator.pushNamed(context, '/notificationList'),
                    },
                    child: Text(
                      "Check All FeedBack".toUpperCase(),
                      style: const TextStyle(
                        color: kFriendlyColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
