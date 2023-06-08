import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/delegatedText.dart';
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/utils/constant.dart';

import '../../routes/routes.dart';

class MecHomePage extends StatelessWidget {
  MecHomePage({super.key});

  ProfileController profileController = Get.put(ProfileController());
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirm Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    Get.back();
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: kAccenstColor,
        appBar: const DefaultAppBar(
          title: 'Dashboard',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .25,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kWhiteColor,
                        boxShadow: const [
                          BoxShadow(
                              color: kLightColor,
                              blurRadius: 1.0,
                              offset: Offset(1, 3)),
                        ],
                      ),
                      child: Obx(
                        () => profileController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 228, 236, 230),
                                    maxRadius: 50,
                                    minRadius: 50,
                                    child: ClipOval(
                                      child: Image.memory(
                                        profileController.userProfile!.image,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                        // alignment: Alignment.topRight,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    profileController.userProfile!.bizName ??
                                        profileController.userProfile!.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: kFriendlyColor,
                                        fontFamily: 'Schyuler'),
                                  ),
                                  Text(
                                    profileController
                                            .userProfile!.shopAddress ??
                                        '',
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: kFriendlyColor,
                                        fontFamily: 'Schyuler'),
                                  ),
                                ],
                              ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  height: size.height * .45,
                  width: size.width,
                  padding: const EdgeInsets.all(kFixedPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kWhiteColor,
                    boxShadow: const [
                      BoxShadow(
                          color: kLightColor,
                          blurRadius: 1.0,
                          offset: Offset(1, 3)),
                    ],
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * .3,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          width: size.width * .85,
                          height: size.height * .12,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: kLessPadding),
                              ),
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                    color: kFriendlyColor,
                                    style: BorderStyle.solid),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              Get.toNamed(Routes.updatePage),
                            },
                            child: const Text(
                              "Account Information",
                              style: TextStyle(
                                color: kFriendlyColor,
                                fontSize: 20.0,
                                fontFamily: 'Schuyler',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          width: size.width * .85,
                          height: size.height * .12,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: kLessPadding),
                              ),
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                    color: kFriendlyColor,
                                    style: BorderStyle.solid),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              Get.toNamed(Routes.requestPage),
                            },
                            child: const Text(
                              "Available Request",
                              style: TextStyle(
                                color: kFriendlyColor,
                                fontSize: 20.0,
                                fontFamily: 'Schuyler',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          width: size.width * .85,
                          height: size.height * .12,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: kLessPadding),
                              ),
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                    color: kFriendlyColor,
                                    style: BorderStyle.solid),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              Get.toNamed(Routes.notificationList),
                            },
                            child: const Text(
                              "All Feedback",
                              style: TextStyle(
                                color: kFriendlyColor,
                                fontSize: 20.0,
                                fontFamily: 'Schuyler',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
