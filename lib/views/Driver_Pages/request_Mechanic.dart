import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/getMecController.dart';
import 'package:welcome/utils/constant.dart';

class Request_Mechanic extends StatefulWidget {
  const Request_Mechanic({super.key});

  @override
  State<Request_Mechanic> createState() => _Request_MechanicState();
}

class _Request_MechanicState extends State<Request_Mechanic> {
  GetMecController getMecController = Get.put(GetMecController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Request for mechanic',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Container(
          height: size.height * .58,
          width: size.width,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kWhiteColor,
            boxShadow: const [
              BoxShadow(
                  color: kLightColor, blurRadius: 1.0, offset: Offset(1, 3)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 228, 236, 230),
                    maxRadius: 50,
                    minRadius: 50,
                    child: ClipOval(
                      child: Image.memory(
                        getMecController.mec!.image,
                        height: 85,
                        width: 85,
                        fit: BoxFit.cover,
                        // alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                ),
                Text(
                  getMecController.mec!.bizName,
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
                Text(
                  getMecController.mec!.phone,
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: kLightColor,
                  ),
                ),
                Text(
                  getMecController.mec!.shopAddress,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: kLightColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${getMecController.mec!.distance}km away from your current location',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Schyuler',
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: kLightColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * .07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kFriendlyColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Request',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
