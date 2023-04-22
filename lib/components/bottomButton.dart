import 'package:flutter/material.dart';
import 'package:welcome/components/outlineDefaultButton.dart';
import 'package:welcome/utils/constant.dart';

import '../routes/routes.dart';

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
          children: [
            OutlineDefaultButton(
              btnText: 'Sign in',
              press: Routes.login,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            OutlineDefaultButton(
              btnText: 'Sign Up',
              press: Routes.registerPage,
            ),
          ],
        ),
      ),
    );
  }
}
