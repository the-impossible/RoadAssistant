import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/components/inputField.dart';
import 'package:welcome/controllers/login_controller.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/formValidation.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // This widget is the root of your application.
  bool _obscureText = true;

  _toogle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontFamily: 'Schyuler',
                              fontSize: 30.0,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10.0,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(200.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 02,
                        ),
                        SizedBox(
                          width: 420,
                          child: inputField(
                              validator: FormValidation.validateEmail,
                              formController: loginController.emailController,
                              fieldIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: 'Email',
                              obscure: false),
                        ),
                        SizedBox(
                          width: 420,
                          child: inputField(
                            fieldIcon:
                                const Icon(Icons.lock, color: Colors.black),
                            hintText: 'Password',
                            formController: loginController.passwordController,
                            validator: FormValidation.validatePassword,
                            obscure: _obscureText,
                            suffixIcon: GestureDetector(
                              onTap: () => _toogle(),
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 330,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent),
                              // shape:MaterialStateProperty.all(outlinedBorder: OutlinedBorder(10.0)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Call login controller
                                loginController.verifyLogin();
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30.0, fontFamily: 'Schyuler'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {}),
                          child: const Text('Forget password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17.0,
                                  fontFamily: 'Schyuler')),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.registerPage);
                          },
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Not a member?',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontFamily: 'Schyuler')),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    fontFamily: 'Schyuler',
                                    color: Colors.blue,
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
          ],
        ),
      ),
    );

    //
  }
}
