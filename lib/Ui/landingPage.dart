import 'package:flutter/material.dart';
import 'package:welcome/Intro/components/bottomButton.dart';
import 'package:welcome/Intro/components/centerTagLine.dart';
import 'package:welcome/Intro/components/topLanding.dart';
import 'package:welcome/constant.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: const [
          TopLanding(),
          CenterTagLine(),
          BottomButton(),
        ],
      ),
    );
  }
}
