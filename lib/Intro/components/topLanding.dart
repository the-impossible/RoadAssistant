import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';

class TopLanding extends StatelessWidget {
  const TopLanding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        flex: 1,
        child: Container(
          // padding: EdgeInsets.only(top: 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Image(
                    image: AssetImage(landing),
                    height: 170,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Get Mechanics',
                  style: TextStyle(color: kShow),
                ),
              ]),
        ),
      ),
    );
  }
}
