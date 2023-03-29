import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';
import 'package:welcome/Mechanic_page/notificationTitles.dart';
import 'package:welcome/Mechanic_page/notification_page.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(
          title: 'Notifications',
          child: DefaultBackButton(),
        ),
        body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 15,
          itemBuilder: (context, index) {
            return NotificationTiles(
                title: 'COMMENT',
                subtitle: 'Your customer just send you feedback',
                enabled: true,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationPage())));
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ));
  }
}
