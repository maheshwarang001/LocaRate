import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locale_loom_app/data/app_exception.dart';
import 'package:locale_loom_app/utils/singelton/singelton_postion.dart';
import 'package:locale_loom_app/utils/utils.dart';
import '../services/location_service.dart';

// ViewModel responsible for handling logic related to the SplashScreen
class SplashScreenViewModel with ChangeNotifier {

  // Method to retrieve the user's current location
  Future<void> getLocationClient(BuildContext context) async {
    try {
      // Get current location using the LocationService
      Position p = await LocationService().getCurrentLocation(context);

      // Log latitude and longitude for debugging purposes
      print('${p.latitude}, ${p.longitude}');

      // Update the SingletonPosition with the current location
      SingletonPosition notify = SingletonPosition(p);

    } catch (err) {
      // Throw a BadRequestException in case of an error
      throw BadRequestException(err.toString());
    }
  }
}