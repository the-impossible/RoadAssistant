import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:welcome/constant.dart';

class IntroData extends StatelessWidget {
  final String? introImage, headText, descText;
  IntroData(
      {super.key,
      required this.introImage,
      required this.headText,
      required this.descText});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: Stack(
              children: [
                SvgPicture.asset(
                  FFF,
                  fit: BoxFit.cover,
                  // width: 1000,
                  height: 620,
                ),
                Positioned(
                  top: 200,
                  right: 0,
                  left: 0,
                  child: Image(
                    image: AssetImage(introImage!),
                    height: 280.0,
                  ),
                ),
              ],
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            headText!,
            style: kHeadTextStyle,
          ),
          Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Text(
              textAlign: TextAlign.center,
              descText!,
              style: kSubTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
