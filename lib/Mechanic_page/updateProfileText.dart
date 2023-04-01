import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/constant.dart';

import '../routes/routes.dart';

class UpdateProfileText extends StatelessWidget {
  const UpdateProfileText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: const Divider(
              color: kDarkColor,
              thickness: 3,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0, bottom: 5.0),
            alignment: Alignment.bottomLeft,
            width: 500,
            // decoration: BoxDecoration(
            // border: Border.all(color: kDarkColor),
            // ),
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.updatePage);
              },
              child: const Text(
                "Edit Profile",
                style: kSubTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            alignment: Alignment.bottomLeft,
            width: 500,
            // decoration: BoxDecoration(
            //     border: Border.all(color: kDarkColor),
            //     shape: BoxShape.rectangle),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              child: const Text(
                "Setting",
                style: kSubTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.aboutPage);
              },
              child: const Text(
                "About Us",
                style: kSubTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            alignment: Alignment.bottomLeft,
            width: 500,
            // decoration: BoxDecoration(
            //   border: Border.all(color: kDarkColor),
            // ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              child: const Text(
                "Help Center",
                style: kSubTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.login);
              },
              child: const Text(
                "Logout",
                style: kSubTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
