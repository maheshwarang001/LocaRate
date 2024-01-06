import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locale_loom_app/data/response/location_response/location_status.dart';
import 'package:locale_loom_app/utils/utils.dart';

import '../data/app_exception.dart';

// Service class for managing location-related functionality
class LocationService {

  // Method to retrieve the current location
  Future<Position> getCurrentLocation(BuildContext context) async {
    try {
      // Request location permission using Geolocator
      LocationPermission permission = await Geolocator.requestPermission();

      // Handle the permission response
      return permissionResponse(context, permission);
    } catch (err) {
      // Throw a BadRequestException in case of an error
      throw BadRequestException(err.toString());
    }
  }

  // Method to handle the response based on location permission
  Future<Position> permissionResponse(context, LocationPermission permission) async {
    switch (permission) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
      // Show a toast message for denied or unable-to-determine permissions
        Utils.showToastMessage("Permission Denied", context: context);
        // Throw a NoPermissionException with the permission name
        throw NoPermissionException(permission.name);
      default:
      // If permission is granted, get the current position with high accuracy
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
    }
  }
}
