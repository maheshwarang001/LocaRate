// Model class representing records for the database
class Records {

  // Private fields for record details
  int? _id;
  String? _name;
  String? _address;
  double? _lat;
  double? _lng;
  String? _urlPath;
  String? _rating;
  String? _time;

  // Constructor to initialize record details
  Records(
      this._name,
      this._address,
      this._lat,
      this._lng,
      this._urlPath,
      this._rating,
      this._time,
      );

  // Method to convert record details to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'address': _address,
      'lat': _lat,
      'lng': _lng,
      'urlPath': _urlPath,
      'rating': _rating,
      'time': _time,
    };
  }

  // Factory method to create a Records instance from a JSON map
  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      json['name'] as String,
      json['address'] as String,
      json['lat']?.toDouble(),
      json['lng']?.toDouble(),
      json['urlPath'] as String,
      json['rating'].toString(),
      json['time'] as String,
    );
  }

  // Getter and setter for the 'id' field
  int? get id => _id;
  set id(int? value) {
    _id = value;
  }

  // Getter and setter for the 'name' field
  String? get name => _name;
  set name(String? value) {
    _name = value;
  }

  // Getter and setter for the 'address' field
  String? get address => _address;
  set address(String? value) {
    _address = value;
  }

  // Getter and setter for the 'time' field
  String? get time => _time;
  set time(String? value) {
    _time = value;
  }

  // Getter and setter for the 'rating' field
  String? get rating => _rating;
  set rating(String? value) {
    _rating = value;
  }

  // Getter and setter for the 'urlPath' field
  String? get urlPath => _urlPath;
  set urlPath(String? value) {
    _urlPath = value;
  }

  // Getter and setter for the 'lng' field
  double? get lng => _lng;
  set lng(double? value) {
    _lng = value;
  }

  // Getter and setter for the 'lat' field
  double? get lat => _lat;
  set lat(double? value) {
    _lat = value;
  }
}
