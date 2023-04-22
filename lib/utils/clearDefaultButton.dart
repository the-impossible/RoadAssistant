import 'package:flutter/material.dart';
import 'package:welcome/utils/constant.dart';

class ClearDefaultButton extends StatelessWidget {
  final Function press;
  final String name;
  const ClearDefaultButton({
    Key? key,
    required this.press,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press() ,
        child: Text(
          name.toUpperCase(),
          style: const TextStyle(
            color: KHeadColor,
          ),
        ));
  }
}
