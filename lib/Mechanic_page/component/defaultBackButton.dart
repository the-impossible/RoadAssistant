import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: kWhiteColor,
      ),
    );
  }
}
