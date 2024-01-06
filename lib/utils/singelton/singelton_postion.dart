import 'package:geolocator/geolocator.dart';


// Singleton class to store and manage the user's current geolocation
class SingletonPosition {
  // Private instance variable to hold the single instance of the class
  static SingletonPosition? _instance;

  // Private variable to store the current Position
  Position? _position;

  // Private constructor to ensure the class cannot be instantiated directly
  SingletonPosition._internal(this._position);

  // Factory constructor to create a new instance of SingletonPosition
  factory SingletonPosition(Position p) {
    // If there is no existing instance, create a new one with the provided position
    if (_instance == null) {
      _instance = SingletonPosition._internal(p);
    } else {
      // If an instance already exists, update its position with the provided one
      _instance!._position = p;
    }
    // Return the instance (either newly created or existing)
    return _instance!;
  }

  // Static method to retrieve the current Position from the singleton instance
  static Position? getValue() {
    return _instance?._position;
  }
}
