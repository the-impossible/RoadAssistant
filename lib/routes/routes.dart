import 'package:get/get.dart';
import 'package:welcome/components/bttonNavBar.dart';
import 'package:welcome/utils/intro.dart';
import 'package:welcome/views/Driver_Pages/complete_taskPage.dart';
import 'package:welcome/views/Driver_Pages/drivProfile.dart';
import 'package:welcome/views/Driver_Pages/homePage.dart';
import 'package:welcome/views/Driver_Pages/nearbyMechanics.dart';
import 'package:welcome/views/Driver_Pages/request_Mechanic.dart';
import 'package:welcome/views/Driver_Pages/tasksPage.dart';
import 'package:welcome/views/Mechanic_page/MecHome.dart';
import 'package:welcome/views/Pages/about_page.dart';
import 'package:welcome/views/Pages/help_Page.dart';
import 'package:welcome/views/Mechanic_page/mecProfile.dart';
import 'package:welcome/views/Mechanic_page/notificationList.dart';
import 'package:welcome/views/Mechanic_page/notification_page.dart';
import 'package:welcome/views/Mechanic_page/request_page.dart';
import 'package:welcome/views/Mechanic_page/request_status.dart';
import 'package:welcome/views/onBoarding/landingPage.dart';
import 'package:welcome/views/onBoarding/login.dart';
import 'package:welcome/views/onBoarding/register.dart';
import 'package:welcome/views/onBoarding/timerSplashScreen.dart';
import 'package:welcome/views/Mechanic_page/update_page.dart';

class Routes {
  static String splash = '/';
  static String login = '/login';
  static String intro = '/intro';
  static String registerPage = '/registerPage';
  static String landing = '/landing';
  static String mecProfilePage = '/mecProfilePage';
  static String mecHomePage = '/mecHomePage';
  static String bottomNavBar = '/bottomNavBar';
  static String aboutPage = '/aboutPage';
  static String updatePage = '/updatePage';
  static String requestPage = '/requestPage';
  static String notificationList = '/notificationList';
  static String notificationPage = '/notificationPage';
  static String driverPage = '/driverPage';
  static String nearbyMechanics = '/nearbyMechanics';
  static String driverProfile = '/driverProfile';
  static String helpPage = '/helpPage';
  static String taskPage = '/taskPage';
  static String requestPageStatus = '/requestPageStatus';
  static String request_mechanic = '/request_mechanic';
  static String complete_taskPage = '/complete_taskPage';

  // MecHomePage
}

final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.login,
    page: () => Login(),
  ),
  GetPage(
    name: Routes.landing,
    page: () => const Landing(),
  ),
  GetPage(
    name: Routes.mecProfilePage,
    page: () => const Mec_profilePage(),
  ),
  GetPage(
    name: Routes.bottomNavBar,
    page: () => const BottomNavBar(),
  ),
  GetPage(
    name: Routes.aboutPage,
    page: () => const AboutPage(),
  ),
  GetPage(
    name: Routes.updatePage,
    page: () => const Update_Page(),
  ),
  GetPage(
    name: Routes.requestPage,
    page: () => const RequestPage(),
  ),
  GetPage(
    name: Routes.notificationList,
    page: () => const NotificationList(),
  ),
  GetPage(
    name: Routes.notificationPage,
    page: () => const NotificationPage(),
  ),
  GetPage(
    name: Routes.driverPage,
    page: () => const DriverHome(),
  ),
  GetPage(
    name: Routes.nearbyMechanics,
    page: () => const Nearby_Mechanic(),
  ),
  GetPage(
    name: Routes.intro,
    page: () => Intro(),
  ),
  GetPage(
    name: Routes.registerPage,
    page: () => const registerPage(),
  ),
  GetPage(
    name: Routes.mecHomePage,
    page: () => const MecHomePage(),
  ),
  GetPage(
    name: Routes.driverProfile,
    page: () => const Driver_Profile(),
  ),
  GetPage(
    name: Routes.helpPage,
    page: () => const Help_Page(),
  ),
  GetPage(
    name: Routes.taskPage,
    page: () => const Task_Page(),
  ),
  GetPage(
    name: Routes.requestPageStatus,
    page: () => const RequestStatusPAGE(),
  ),
  GetPage(
    name: Routes.request_mechanic,
    page: () => const Request_Mechanic(),
  ),
  GetPage(
    name: Routes.complete_taskPage,
    page: () => const Complete_task(),
  )
];
