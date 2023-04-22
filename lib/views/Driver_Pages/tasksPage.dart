import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/utils/constant.dart';
import '../../routes/routes.dart';

class Task_Page extends StatefulWidget {
  const Task_Page({super.key});

  @override
  State<Task_Page> createState() => _Task_PageState();
}

class _Task_PageState extends State<Task_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(
          title: 'Task page',
          child: DefaultBackButton(),
        ),
        body: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: const Text(
                    'REQUEST',
                    style: TextStyle(
                      fontFamily: 'Schyuler',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: const Text(
                    'view details',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: kLightColor,
                    ),
                  ),
                  enabled: true,
                  onTap: () {
                    Get.toNamed(Routes.complete_taskPage);
                  },
                  leading: const Icon(
                    Icons.notification_important_outlined,
                    size: 35,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                ),
                const Divider()
              ],
            );
          },
        ));
  }
}
