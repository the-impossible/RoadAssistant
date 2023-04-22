import 'package:flutter/material.dart';
import 'package:welcome/components/defaultAppBar.dart';
import 'package:welcome/utils/constant.dart';

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
