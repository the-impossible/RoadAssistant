import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';
import 'package:welcome/routes/routes.dart';

import '../Intro/components/outlineDefaultButton.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 140),
              child: Image(
                image: AssetImage(landing),
                height: 170,
              ),
            ),
            const SizedBox(height: 100),
            const Text(
              'Get Mechanics',
              style: TextStyle(
                color: kShow,
                fontFamily: 'Schyuler',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: const Divider(
                color: kPrimaryColor,
                thickness: 2,
              ),
            ),
            const Text(
              'Lets get you mechanic to solve your issue in sec',
              style: TextStyle(color: kPrimaryColor, fontFamily: 'Schyuler'),
            ),
            const SizedBox(height: 100),
            OutlineDefaultButton(
              btnText: 'Sign in',
              press: Routes.login,
            ),
            const SizedBox(height: kDefaultPadding),
            OutlineDefaultButton(
              btnText: 'Sign Up',
              press: Routes.registerPage,
            ),
          ],
        ),
      ),
    );
  }
}
