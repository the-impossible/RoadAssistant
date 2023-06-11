import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/getDriverHistoryController.dart';
import 'package:welcome/models/driver_history.dart';
import 'package:welcome/utils/constant.dart';
import '../../routes/routes.dart';

class Task_Page extends StatefulWidget {
  const Task_Page({super.key});

  @override
  State<Task_Page> createState() => _Task_PageState();
}

class _Task_PageState extends State<Task_Page> {
  GetDriverHistoryController getDriverHistoryController =
      Get.put(GetDriverHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Assistance History',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FutureBuilder<List<DriverHistory>?>(
          future: getDriverHistoryController.getHistory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is loading
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // If an error occurred
              return Center(
                child: Text(
                  'ERROR: ${snapshot.error}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Schuyler',
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              // If the data is available
              List<DriverHistory> driverHistory = snapshot.data!;
              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: driverHistory.length,
                itemBuilder: (context, index) {
                  final historyData = driverHistory[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          historyData.bizName,
                          style: const TextStyle(
                            fontFamily: 'Schyuler',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          '${historyData.distance}Km away',
                          style: const TextStyle(
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
                          color: kFriendlyColor,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      const Divider()
                    ],
                  );
                },
              );
            } else {
              // If there is no data available
              return const Center(
                child: Text(
                  'No data available!',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Schuyler',
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
