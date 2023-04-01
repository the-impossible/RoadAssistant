import 'package:flutter/material.dart';

import 'package:welcome/constant.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? child;
  const DefaultAppBar({
    Key? key,
    required this.title,
    this.child,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: kDarkColor,
          fontFamily: 'Schuyler',
          fontWeight: FontWeight.bold,
        ),
      ),
      // elevation: kRadius,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: kFriendlyColor,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      shadowColor: kWhiteColor,
      leading: child,
    );
  }
}
