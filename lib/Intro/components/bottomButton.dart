import 'package:flutter/material.dart';
import 'package:welcome/Intro/components/outlineDefaultButton.dart';
import 'package:welcome/constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            OutlineDefaultButton(
              btnText: 'Sign in',
              press: '/login',
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            OutlineDefaultButton(
              btnText: 'Sign Up',
              press: '/registerPage',
            ),
          ],
        ),
      ),
    );
  }
}
