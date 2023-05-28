import 'package:flutter/material.dart';
import 'package:welcome/utils/constant.dart';
import 'package:welcome/views/Mechanic_page/MecHome.dart';
import 'package:welcome/views/Mechanic_page/mecProfile.dart';
import 'package:welcome/views/Mechanic_page/taskRec.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List pages = [
    MecHomePage(),
    TaskPage(),
    Mec_profilePage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccenstColor,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        // unselectedFontSize: 0,
        // type: BottomNavigationBarType.fixed,
        backgroundColor: kDarkColor,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: kLess,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Task",
            icon: Icon(
              Icons.task,
            ),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
