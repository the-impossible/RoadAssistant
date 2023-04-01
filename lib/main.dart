import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome/constant.dart';
import 'package:get/get.dart';
import 'package:welcome/routes/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kTransparentColor),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccenstColor,
        fontFamily: 'Schyuler',
      ),
      initialRoute: Routes.splash,
      getPages: getPages,
    );
  }
}
