import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/constant.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kAccenstColor,
      appBar: DefaultAppBar(title: 'TASK'),
    );
  }
}
