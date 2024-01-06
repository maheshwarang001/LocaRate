// Model class representing parameters for API requests
class ParamModel {

  // Private fields for latitude, longitude, radius, and keyword
  double? _lat;
  double? _lng;
  int? _radius;
  String? _keyword;

  // Getter and setter for latitude
  double? get lat => _lat;
  set lat(double? value) {
    _lat = value;
  }

  // Getter and setter for longitude
  double? get lng => _lng;
  set lng(double? value) {
    _lng = value;
  }

  // Getter and setter for keyword
  String? get keyword => _keyword;
  set keyword(String? value) {
    _keyword = value;
  }

  // Getter and setter for radius
  int? get radius => _radius;
  set radius(int? value) {
    _radius = value;
  }
}
