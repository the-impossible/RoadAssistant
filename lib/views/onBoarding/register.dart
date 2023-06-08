import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/controllers/register_controller.dart';
import 'package:welcome/utils/constant.dart';
import 'package:welcome/components/inputField.dart';
// import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/formValidation.dart';
import '../../routes/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  RegisterController registerController = Get.put(RegisterController());

  bool _obscureText = true;

  _toogle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var dropdownValue;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          padding: const EdgeInsets.only(top: 70.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyuler',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: inputField(
                      validator: FormValidation.validateName,
                      fieldIcon: const Icon(Icons.person, color: Colors.black),
                      hintText: 'Full name',
                      formController: registerController.nameController,
                      obscure: false,
                    ),
                  ),
                  inputField(
                    validator: FormValidation.validateEmail,
                    fieldIcon:
                        const Icon(Icons.person_outline, color: Colors.black),
                    hintText: 'Email',
                    obscure: false,
                    formController: registerController.emailController,
                  ),
                  inputField(
                    fieldIcon: const Icon(Icons.phone, color: Colors.black),
                    hintText: 'Phone',
                    validator: FormValidation.validatePhoneNumber,
                    obscure: false,
                    formController: registerController.phoneController,
                  ),
                  inputField(
                    validator: FormValidation.validatePassword,
                    fieldIcon:
                        const Icon(Icons.lock_outlined, color: Colors.black),
                    hintText: 'Password',
                    obscure: _obscureText,
                    formController: registerController.passwordController,
                    suffixIcon: GestureDetector(
                      onTap: () => _toogle(),
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a user type';
                        }
                        return null; // Return null if the validation passes
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        fillColor: const Color.fromARGB(255, 218, 212, 212),
                        filled: true,
                        labelStyle: const TextStyle(color: kPrimaryColor),
                      ),
                      hint: const Text(
                        "User Type",
                        style: TextStyle(fontSize: 20),
                      ),
                      value: dropdownValue,
                      items: ['Driver', 'Mechanic'].map(
                        (item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (nvalue) {
                        setState(
                          () {
                            dropdownValue = nvalue;
                            registerController.userType = dropdownValue;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width * .9,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Call register controller
                          registerController.createAccount();
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Schyuler',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.login);
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Already have account?',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Schyuler')),
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.blue,
                              fontFamily: 'Schyuler',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
