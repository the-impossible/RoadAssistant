import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF8084);
const kLightPinkColor = Color.fromRGBO(243, 232, 232, 1);
const kAccenstColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kGroundColor = Color.fromARGB(255, 185, 211, 231);
const KHeadColor = Colors.pink;
const kTransparentColor = Colors.transparent;
const kShow = Color.fromARGB(255, 248, 19, 3);
const kFriendlyColor = Colors.blue;
// const kNotWhiteColor = Color.fromARGB(255, 248, 236, 236);

const kDefaultPadding = 20.0;
const kLessPadding = 13.0;
const kFixedPadding = 10.0;
const kLess = 4.0;

const kShap = 30.0;

const kRadius = 20.0;
const kAppBarHeight = 56.0;

const kHeadTextStyle = TextStyle(
  fontFamily: 'Schuyler',
  fontSize: 30.0,
  color: KHeadColor,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontFamily: 'Schuyler',
  fontSize: 20.0,
  color: kDarkColor,
);

const kTitlTextStyle = TextStyle(
  fontFamily: 'Schuyler',
  fontSize: 18.0,
  color: kPrimaryColor,
);

const String welcom = 'assets/images/welcome.png';
const String routine = 'assets/images/routine.jpeg';
const String findMechanic = 'assets/images/mea.png';
const String whiteShape = 'assets/images/background.svg';
const String wild = 'assets/images/wild.svg';
const String bg = 'assets/images/bg.svg';
const String FFF = 'assets/images/FFF.svg';
const String landing = 'assets/images/landingimg.jpeg';
const String Splash = 'assets/images/Logo.svg';
const String WhatsApp = 'assets/images/whatsapp.jpg';
const String telegram = 'assets/images/telegram.png';
const String facebook = 'assets/images/facebook.png';

List<Map<String, String>> introData = [
  {
    'image': welcom,
    'headText': 'WELCOME',
    'descText':
        "Where you can find solution to your vehicle problem without stress",
  },
  {
    'image': routine,
    'headText': 'TRACK YOUR ROUTINE',
    'descText':
        "Here you can find your way to the nearby mechanics without stress",
  },
  {
    'image': findMechanic,
    'headText': 'NEARBY MECHANICS',
    'descText':
        "Find any mechanic of your choice without leaving your location",
  }
];
