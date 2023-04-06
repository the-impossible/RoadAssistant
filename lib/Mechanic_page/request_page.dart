import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';
import 'package:welcome/constant.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'REQUEST',
        child: DefaultBackButton(),
      ),
      body: ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
            title: const Text(
              'New Request',
              style: TextStyle(color: kDarkColor),
            ),
            subtitle: const Text(
              'Thanks for using this app your assistance is needed',
              style: TextStyle(color: kLightColor),
            ),
            onTap: () {},
            enabled: true,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1.6,
          );
        },
      ),
    );
  }
}
