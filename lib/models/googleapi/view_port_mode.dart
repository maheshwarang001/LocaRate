import 'package:locale_loom_app/models/googleapi/northeast_model.dart';
import 'package:locale_loom_app/models/googleapi/southwest_model.dart';

class ViewPort{

  Northeast? _northeast;
  Southwest? _southwest;

  Northeast? get northeast => _northeast;

  set northeast(Northeast? value) {
    _northeast = value;
  }

  Southwest? get southwest => _southwest;

  set southwest(Southwest? value) {
    _southwest = value;
  }

  ViewPort.fromJson(Map<String, dynamic> json) {
    _northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    _southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
}