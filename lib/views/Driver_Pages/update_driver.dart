import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/components/defaultBackButton.dart';
import 'package:welcome/controllers/profile_controller.dart';
import 'package:welcome/controllers/updateDriverController.dart';
import 'package:welcome/controllers/updateProfile_controller.dart';
import 'package:welcome/utils/constant.dart';
import 'package:welcome/components/inputField.dart';
import 'package:welcome/utils/customFunction.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/formValidation.dart';

class UpdateDriver extends StatefulWidget {
  const UpdateDriver({super.key});

  @override
  State<UpdateDriver> createState() => _UpdateDriverState();
}

class _UpdateDriverState extends State<UpdateDriver> {
  ProfileController profileController = Get.put(ProfileController());
  UpdateDriverController updateDriverController =
      Get.put(UpdateDriverController());

  final _formKey = GlobalKey<FormState>();

  File? image;

  Future pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return;

      setState(() {
        image = File(pickedFile.path);
        updateDriverController.image = image;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Uploading image failed!", false));
    }
  }

  @override
  void initState() {
    super.initState();

    updateDriverController.nameController.text =
        profileController.userProfile!.name;
    updateDriverController.phoneController.text =
        profileController.userProfile!.phone;
    updateDriverController.userId = profileController.userProfile!.userId;
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
                  formController: updateDriverController.nameController,
                  obscure: false,
                  validator: FormValidation.validateName,
                ),
                inputField(
                  fieldIcon:
                      const Icon(Icons.phone_android, color: Colors.black),
                  hintText: 'Phone Number',
                  obscure: false,
                  validator: FormValidation.validatePhoneNumber,
                  formController: updateDriverController.phoneController,
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
                                  'proceed with updating your account?'),
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

                                    updateDriverController
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
