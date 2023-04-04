import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';
import 'package:welcome/constant.dart';

import '../routes/routes.dart';

class Driver_Profile extends StatefulWidget {
  const Driver_Profile({super.key});

  @override
  State<Driver_Profile> createState() => _Driver_ProfileState();
}

class _Driver_ProfileState extends State<Driver_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccenstColor,
      appBar: const DefaultAppBar(
        title: 'PROFILE',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 15.0,
          right: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  width: 80,
                  height: 100,
                  matchTextDirection: true,
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'DRIVERID:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Schuyler',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'NAME:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Schuyler',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
            ),

            InkWell(
              onTap: () {
                Get.toNamed(Routes.updatePage);
              },
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                alignment: Alignment.bottomLeft,
                width: 500,
                // decoration: BoxDecoration(
                // border: Border.all(color: kDarkColor),
                // ),
                child: const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Edit Profile",
                    style: kSubTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                alignment: Alignment.bottomLeft,
                width: 500,
                child: const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Setting",
                    style: kSubTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),

            const Divider(
              thickness: 1.5,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.aboutPage);
              },
              child: Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                width: 500,
                child: const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "About Us",
                    style: kSubTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),

            const Divider(
              thickness: 1.5,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.helpPage);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                width: 500,
                child: const ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Help Center",
                    style: kSubTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  // ),
                ),
              ),
            ),

            const Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.login);
                  },
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Schuyler',
                    ),
                  ),
                ),
              ),
            )

            // SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
