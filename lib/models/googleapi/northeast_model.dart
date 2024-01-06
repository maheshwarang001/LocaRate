class Northeast{
  double? _lat;
  double? _lng;

  double? get lat => _lat;
  double? get lng => _lng;

  set lat(double? lat) {
    _lat = lat;
  }

  set lng(double? lng) {
    _lng = lng;
  }

  Northeast.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
}