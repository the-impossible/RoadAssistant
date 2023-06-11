import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome/utils/constant.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: kWhiteColor,
      ),
    );
  }
}
