import 'package:locale_loom_app/models/googleapi/location_model.dart';
import 'package:locale_loom_app/models/googleapi/view_port_mode.dart';

class Geometry{
  Location? _location;
  ViewPort? _viewport;

  Location? get location => _location;

  ViewPort? get viewport => _viewport;

  Geometry.fromJson(Map<String, dynamic> json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _viewport = json['viewport'] != null ? ViewPort.fromJson(json['viewport']) : null;
  }

  set location(Location? location) {
    _location = location;
  }

  set viewport(ViewPort? viewport) {
    _viewport = viewport;
  }
}