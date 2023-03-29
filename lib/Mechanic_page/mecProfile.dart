import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';
import 'package:welcome/Mechanic_page/updateProfileText.dart';
import 'package:welcome/constant.dart';

class Mec_profilePage extends StatelessWidget {
  const Mec_profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccenstColor,
      appBar: const DefaultAppBar(
        title: 'PROFILE',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  width: 100,
                  height: 100,
                  matchTextDirection: true,
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: const [
                    Text(
                      'MECID:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'NAME:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(height: 20.0),
            UpdateProfileText(),
          ],
        ),
      ),
    );
  }
}
