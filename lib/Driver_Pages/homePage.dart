import 'package:flutter/material.dart';
import 'package:welcome/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {

  List<IconData> _icons = [
    FontAwesomeIcons.plane
  ];
  // List<String> listItems = List<String>.generate(50, (i) => "List")
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DASHBOARD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // backgroundColor: kWhiteColor,
      ),
      body: Container(
        color: kWhiteColor,
        padding: EdgeInsets.only(top: 19.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kWhiteColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                    color: kLightColor,
                    blurRadius: 1.0,
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 05.0, left: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    height: 60,
                    width: 60,
                    matchTextDirection: true,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'BeeJAY',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 230,
                  ),
                  const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kWhiteColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                    color: kLightColor,
                    blurRadius: 1.0,
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 05.0, left: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    height: 60,
                    width: 60,
                    matchTextDirection: true,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'BeeJAY',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 230,
                  ),
                  const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          reverse: false,
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(0),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.blueAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 90,
                      width: 90,
                      alignment: Alignment.topCenter,
                    ),
                    const Text(
                      'Bolaji Olagoke',
                      style: TextStyle(fontSize: 25.0, color: kWhiteColor),
                    ),
                  ],
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 30.0,
              thickness: 2.0,
            ),
            const ListTile(
              leading: Icon(Icons.car_repair),
              title: Text(
                'Nearby Mechanics',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 30.0,
              thickness: 2.0,
            ),
            const ListTile(
              leading: Icon(Icons.task),
              title: Text(
                'Task',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              thickness: 2.0,
              height: 30.0,
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              thickness: 2.0,
              height: 30.0,
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
