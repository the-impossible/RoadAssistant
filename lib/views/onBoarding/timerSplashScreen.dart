import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:welcome/utils/constant.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () => Get.offNamed(Routes.intro),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: AlignmentDirectional.center,
          color: kWhiteColor,
          child: Stack(
            children: [
              SvgPicture.asset(
                Splash,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
