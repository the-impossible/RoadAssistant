import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';
import 'package:welcome/inputField.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    var dropdownValue;
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: kWhiteColor,
      //   elevation: 02,
      // ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          padding: const EdgeInsets.only(top: 70.0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
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
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: inputField(
                      const Icon(Icons.person, color: Colors.black),
                      'Full Name',
                      obscure: false,
                    ),
                  ),
                  inputField(
                    const Icon(Icons.person_outline, color: Colors.black),
                    'User Name',
                    obscure: false,
                  ),
                  inputField(
                    const Icon(Icons.lock, color: Colors.black),
                    'Password',
                    obscure: true,
                  ),
                  inputField(
                    const Icon(Icons.lock_outlined, color: Colors.black),
                    'Confirm Password',
                    obscure: true,
                  ),
                  inputField(
                    const Icon(Icons.mail, color: Colors.black),
                    'Email',
                    obscure: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        fillColor: const Color.fromARGB(255, 218, 212, 212),
                        filled: true,
                        labelStyle: TextStyle(color: kPrimaryColor),
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
                              style: TextStyle(fontSize: 15.0),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (nvalue) {
                        setState(
                          () {
                            dropdownValue = nvalue;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        // shape:MaterialStateProperty.all(outlinedBorder: OutlinedBorder(10.0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Times New Roman',
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
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Already have account?',
                              style: TextStyle(
                                fontSize: 20.0,
                              )),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.blue,
                              fontFamily: 'Times New Roman',
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
