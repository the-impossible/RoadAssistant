import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/constant.dart';

class OutlineDefaultButton extends StatelessWidget {
  final String press;
  final String btnText;
  const OutlineDefaultButton({
    Key? key,
    required this.press,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: kLessPadding),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: kPrimaryColor, style: BorderStyle.solid),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kShap),
            ),
          ),
        ),
        onPressed: () => Get.toNamed(press),
        child: Text(
          btnText.toUpperCase(),
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
