class Location{
  double? _lat;
  double? _lng;

  double? get lat => _lat;
  double? get lng => _lng;

  Location.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  set lat(double? lat) {
    _lat = lat;
  }

  set lng(double? lng) {
    _lng = lng;
  }

}