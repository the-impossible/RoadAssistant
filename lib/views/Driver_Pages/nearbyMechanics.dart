import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/utils/constant.dart';
import '../../routes/routes.dart';

class Nearby_Mechanic extends StatefulWidget {
  const Nearby_Mechanic({super.key});

  @override
  State<Nearby_Mechanic> createState() => _Nearby_MechanicState();
}

class _Nearby_MechanicState extends State<Nearby_Mechanic> {
  @override
  Widget build(BuildContext context) {
    List<String> matchQuery = [];
    // matchQuery.add();
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Nearby Mechanics',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 3.0,
                  ),
                ),
                Card(
                  elevation: 6,
                  shadowColor: kDarkColor,
                  color: kLightPinkColor,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.request_mechanic);
                        },
                        leading: Image.asset(
                          'assets/images/profile.png',
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title: const Text(
                          'Faisol Ademola',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kDarkColor,
                            fontFamily: 'Schyuler',
                          ),
                        ),
                        subtitle: const Text(
                          'Repair all kind of vehicles',
                          style: TextStyle(
                            fontFamily: 'Schyuler',
                            fontStyle: FontStyle.italic,
                            color: kLightColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
