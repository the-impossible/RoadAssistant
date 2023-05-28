import 'package:flutter/material.dart';
import 'package:welcome/utils/constant.dart';

class inputField extends StatelessWidget {
  Icon? fieldIcon;
  String? hintText;
  Widget? suffixIcon;
  final TextEditingController? formController;
  final String? Function(String?)? validator;
  bool obscure;

  inputField(
      {Key? key,
      this.fieldIcon,
      this.hintText,
      this.suffixIcon,
      this.formController,
      this.validator,
      required this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 05.0, right: 05.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(05.0),
                child: TextFormField(
                  validator: validator,
                  controller: formController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: kAccenstColor),
                    prefixIcon: fieldIcon,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: kAccenstColor,
                        ),
                        borderRadius: BorderRadius.circular(15.0)),
                    hintText: hintText,
                    fillColor: const Color.fromARGB(255, 218, 212, 212),
                    filled: true,
                    suffixIcon: suffixIcon,
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
