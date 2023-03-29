import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final void Function()? onTap;
  final bool enabled;
  const NotificationTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: kDarkColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: kLightColor),
      ),
      onTap: onTap,
      enabled: enabled,
    );
  }
}
