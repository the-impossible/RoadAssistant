import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:welcome/utils/customFunction.dart';
import 'package:welcome/utils/loading.dart';

class GetNearbyMecController extends GetxController {
  Future<void> getNearbyMechanic() async {
    // Get the driver location
    Position position = await determinePosition();

    var lat = position.latitude;
    var long = position.longitude;
    

    print("TESTING: ${position.latitude} : ${position.longitude}");
    double distanceInMeters = Geolocator.distanceBetween(
        52.2165157, 6.9437819, 52.3546274, 4.8285838);
    // Get all the mechanics
    // Calculate the distance
    // Order the mechanics base on distance (in or M or Km)
  }
}
