import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome/Driver_Pages/homePage.dart';
import 'package:welcome/Intro/Pages/about_page.dart';
import 'package:welcome/Ui/landingPage.dart';
import 'package:welcome/Ui/login.dart';
import 'package:welcome/Ui/timerSplashScreen.dart';
import 'package:welcome/Mechanic_page/mecProfile.dart';
import 'package:welcome/Mechanic_page/notificationList.dart';
import 'package:welcome/Mechanic_page/notification_page.dart';
import 'package:welcome/Mechanic_page/request_page.dart';
import 'package:welcome/Ui/register.dart';
import 'package:welcome/UpdatePage/update_page.dart';
import 'package:welcome/bottonNavBar/bttonNavBar.dart';
import 'package:welcome/constant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kTransparentColor),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccenstColor,
        fontFamily: 'Schyuler',
      ),
      home: SplashScreen(),
      initialRoute: '',
      routes: {
        '/registerPage': (context) => const registerPage(),
        '/login': (context) => Login(),
        '/landing': (context) => const Landing(),
        '/mecProfilePage': (context) => const Mec_profilePage(),
        '/BottomNavBar': (context) => const BottomNavBar(),
        '/aboutPage': (context) => const AboutPage(),
        '/Update_Page': (context) => const Update_Page(),
        '/request_page': (context) => const RequestPage(),
        '/notificationList': (context) => const NotificationList(),
        '/notificationPage':(context) => const NotificationPage(),
        '/driverPage': (context) => const DriverHome(),
      },
    );
  }
}
