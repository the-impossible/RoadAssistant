import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';

class CenterTagLine extends StatelessWidget {
  const CenterTagLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: const Divider(
                color: kPrimaryColor,
                thickness: 2,
              ),
            ),
            const Text('Lets get you mechanic to solve your issue in sec',
                style: TextStyle(
                  color: kPrimaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
