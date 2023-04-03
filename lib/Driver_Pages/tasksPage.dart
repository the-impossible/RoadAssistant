import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';

class Task_Page extends StatefulWidget {
  const Task_Page({super.key});

  @override
  State<Task_Page> createState() => _Task_PageState();
}

class _Task_PageState extends State<Task_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(
          title: 'Task page',
          child: DefaultBackButton(),
        ),
        body: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text('REQUEST'),
                  subtitle: Text('Your customer just send you feedback'),
                  enabled: true,
                  onTap: () {},
                  leading: Icon(Icons.notification_important_outlined),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
                const Divider()
              ],
            );
          },
        ));
  }
}
