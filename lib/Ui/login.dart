import 'package:flutter/material.dart';
import 'package:welcome/inputField.dart';

class Login extends StatelessWidget {
  // This widget is the root of your application.
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
              padding: EdgeInsets.only(top: 50.0),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
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
                            fontFamily: 'Times New Roman',
                            fontSize: 30.0,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.all(Radius.circular(200.0)),
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
                      Container(
                        width: 420,
                        child: inputField(
                            const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            'Username',
                            obscure: false),
                      ),
                      Container(
                        width: 420,
                        child: inputField(
                          const Icon(Icons.lock, color: Colors.black),
                          'Password',
                          obscure: true,
                        ),
                      ),
                      Container(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                            // shape:MaterialStateProperty.all(outlinedBorder: OutlinedBorder(10.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/driverPage');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30.0, fontFamily: 'Times New Roman'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {}),
                        child: const Text('Forget password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0,
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/registerPage');
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Not a member?',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                  )),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontSize: 19.0,
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
          ],
        ),
      ),
    );

    //
  }
}
