import 'package:flutter/material.dart';
import 'package:welcome/controllers/getMecController.dart';
import 'package:welcome/controllers/getNearbyMecController.dart';
import 'package:welcome/controllers/navigationDrawer.dart';
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/models/get_mec.dart';
import 'package:welcome/models/nearby_mec.dart';
import 'package:welcome/utils/constant.dart';
import 'package:get/get.dart';
import 'package:welcome/utils/loading.dart';
import '../../routes/routes.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  ProfileController profileController = Get.put(ProfileController());
  GetNearbyMecController getNearbyMecController =
      Get.put(GetNearbyMecController());
  GetMecController getMecController = Get.put(GetMecController());

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
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold, color: kDarkColor),
          ),
          centerTitle: true,
          // backgroundColor: kWhiteColor,
        ),
        body: RefreshIndicator(
          onRefresh: () => getNearbyMecController.getNearbyMechanic(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * .13,
                    width: size.width,
                    margin: const EdgeInsets.only(bottom: 10),
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
                    padding: const EdgeInsets.only(top: 05.0, left: 10),
                    child: Obx(
                      () => profileController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 8, bottom: 8),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 228, 236, 230),
                                    maxRadius: 50,
                                    minRadius: 50,
                                    child: ClipOval(
                                      child: Image.memory(
                                        profileController.userProfile!.image,
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                        // alignment: Alignment.topRight,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  profileController.userProfile!.name,
                                  softWrap: true,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Schyuler',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Nearby Mechanics',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Schuyler',
                        fontWeight: FontWeight.bold,
                        color: kDarkColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .7,
                    child: FutureBuilder<List<NearbyMechanic>?>(
                      // future: getNearbyMecController.getNearbyMechanic,
                      future: getNearbyMecController.getNearbyMechanic(),
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
                          List<NearbyMechanic> nearbyMechanics = snapshot.data!;
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: nearbyMechanics.length,
                            itemBuilder: (context, index) {
                              final nearbyData = nearbyMechanics[index];
                              return Column(
                                children: [
                                  Card(
                                    elevation: 3,
                                    shadowColor: kDarkColor,
                                    color: kLightPinkColor,
                                    child: SizedBox(
                                      height: size.height * .1,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListTile(
                                        onTap: () {
                                          getMecController.userID =
                                              nearbyData.userId;

                                          getMecController.processGetNearbyMechanic();
                                        },
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              Color.fromARGB(255, 228, 236, 230),
                                          maxRadius: 20,
                                          minRadius: 20,
                                          child: ClipOval(
                                            child: Image.memory(
                                              nearbyData.image,
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.cover,
                                              // alignment: Alignment.topRight,
                                            ),
                                          ),
                                        ),
                                        trailing: const Icon(
                                            Icons.arrow_forward_ios_outlined),
                                        title: Text(
                                          nearbyData.bizName,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: kDarkColor,
                                            fontFamily: 'Schyuler',
                                          ),
                                        ),
                                        subtitle: Text(
                                          "Distance: ${nearbyData.distance} km",
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontFamily: 'Schyuler',
                                            fontStyle: FontStyle.italic,
                                            color: kLightColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //
                                  ),
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
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: const NavigationDrawer(),
      ),
    );
  }
}
