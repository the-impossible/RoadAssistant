import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/controllers/updateProfile_controller.dart';
import 'package:welcome/utils/constant.dart';
import 'package:welcome/components/inputField.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/formValidation.dart';

class Update_Page extends StatefulWidget {
  const Update_Page({super.key});

  @override
  State<Update_Page> createState() => _Update_PageState();
}

class _Update_PageState extends State<Update_Page> {
  ProfileController profileController = Get.put(ProfileController());
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());

  final _formKey = GlobalKey<FormState>();

  File? image;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Placemark> GetAddressFromPosition(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemark[0];
    return place;
  }

  Future pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return;

      setState(() {
        image = File(pickedFile.path);
        updateProfileController.image = image;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Uploading image failed!", false));
    }
  }

  @override
  void initState() {
    super.initState();

    updateProfileController.nameController.text =
        profileController.userProfile!.name;
    updateProfileController.phoneController.text =
        profileController.userProfile!.phone;
    updateProfileController.emailController.text =
        profileController.userProfile!.email;

    updateProfileController.businessNameController.text =
        profileController.userProfile!.bizName ?? "";

    updateProfileController.userId = profileController.userProfile!.userId;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Update Account',
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 228, 236, 230),
                          maxRadius: 50,
                          minRadius: 50,
                          child: ClipOval(
                            child: (image != null)
                                ? Image.file(
                                    image!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  )
                                : Image.memory(
                                    profileController.userProfile!.image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 80,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: const CircleAvatar(
                              backgroundColor: kWhiteColor,
                              child: Icon(
                                Icons.add_a_photo,
                                color: kFriendlyColor,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                inputField(
                  fieldIcon: const Icon(Icons.person, color: Colors.black),
                  hintText: 'Full Name',
                  formController: updateProfileController.nameController,
                  obscure: false,
                  validator: FormValidation.validateName,
                ),
                inputField(
                  fieldIcon:
                      const Icon(Icons.person_outlined, color: Colors.black),
                  formController:
                      updateProfileController.businessNameController,
                  hintText: 'Business Name',
                  validator: FormValidation.validateBusinessName,
                  obscure: false,
                ),
                inputField(
                  fieldIcon:
                      const Icon(Icons.phone_android, color: Colors.black),
                  hintText: 'Phone Number',
                  obscure: false,
                  validator: FormValidation.validatePhoneNumber,
                  formController: updateProfileController.phoneController,
                ),
                SizedBox(
                  width: size.width * .9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirm Update'),
                              content: const Text(
                                  'Are you in your shop address? if Yes proceed with updating your account?'),
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
                                    Position position =
                                        await _determinePosition();
                                    // update the mechanic latitude and longitude
                                    updateProfileController.latController.text =
                                        position.latitude.toString();
                                    updateProfileController.lonController.text =
                                        position.longitude.toString();

                                    Placemark place =
                                        await GetAddressFromPosition(position);

                                    updateProfileController
                                            .shopController.text =
                                        "${place.street} ${place.locality} ${place.postalCode}";

                                    updateProfileController
                                        .verifyUpdateAccount();
                                  },
                                  child: const Text('Proceed'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Schyuler',
                          fontWeight: FontWeight.bold,
                          color: kDarkColor),
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
