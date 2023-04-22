import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/utils/constant.dart';

import '../../routes/routes.dart';

class UpdateProfileText extends StatelessWidget {
  const UpdateProfileText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: const Divider(
              color: kDarkColor,
              thickness: 1.5,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.updatePage);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              alignment: Alignment.bottomLeft,
              width: 500,
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
            onTap: () {
              Get.toNamed(Routes.mecProfilePage);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
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
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
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
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              alignment: Alignment.bottomLeft,
              width: 500,
              child: const ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  "Help Center",
                  style: kSubTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: 50,
              width: 500,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.login);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Schuyler',
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
