import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/constant.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kFriendlyColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  final size = MediaQuery.of(context).size;
  ProfileController profileController = Get.put(ProfileController());

  return Material(
    color: kWhiteColor,
    child: InkWell(
      child: Container(
        padding: EdgeInsets.only(
          top: size.height * .09,
          bottom: size.height * .05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 228, 236, 230),
              maxRadius: 50,
              minRadius: 50,
              child: ClipOval(
                child: Image.memory(
                  profileController.userProfile!.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              profileController.userProfile!.name,
              softWrap: true,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15),
    child: Wrap(
      runSpacing: 10,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.pop(context);
            Get.toNamed(Routes.driverPage);
          },
        ),
        ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Request History'),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(Routes.taskPage);
            }),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(Routes.updateDriver);
            }),
        const Divider(
          color: Colors.black54,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.login_rounded),
          title: const Text('Logout'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Log out'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Get.back();
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
