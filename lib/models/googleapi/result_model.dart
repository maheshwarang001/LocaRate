import 'package:locale_loom_app/models/googleapi/gemoetry_model.dart';
import 'package:locale_loom_app/models/googleapi/opening_hours_model.dart';
import 'package:locale_loom_app/models/googleapi/photos_model.dart';
import 'package:locale_loom_app/models/googleapi/plus_code.model.dart';

class Result{
  String? _business_status;
  Geometry? _geometry;
  String? _icon;
  String? _icon_background_color;
  String? _icon_mask_base_uri;
  String? _name;
  OpeningHours? _opening_hours;
  List<Photos>? _photos;
  String? _place_id;
  PlusCode? _plus_code;
  int? _price_level;
  double? _rating;
  String? _reference;
  String? _scope;
  List<String>? _types;
  int? _user_ratings_total;
  String? _vicinity;


  Result.fromJson(Map<String, dynamic> json) {
    _business_status = json['business_status'];
    _geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    _icon = json['icon'];
    _icon_background_color = json['icon_background_color'];
    _icon_mask_base_uri = json['icon_mask_base_uri'];
    _name = json['name'];
    _opening_hours =
    json['opening_hours'] != null ? OpeningHours.fromJson(json['opening_hours']) : null;
    _photos = json['photos'] != null
       ? (json['photos'] as List).map((photo) => Photos.fromJson(photo)).toList()
       : null;
    _place_id = json['place_id'];
    _plus_code = json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    _price_level = json['price_level'];
    _rating = json['rating'].toDouble();
    _reference = json['reference'];
    _scope = json['scope'];
    _types = json['types'] != null ? List<String>.from(json['types']) : null;
    _user_ratings_total = json['user_ratings_total']as int?;
    _vicinity = json['vicinity'];
  }

  //getters

  String? get business_status => _business_status;

  Geometry? get geometry => _geometry;

  String? get icon => _icon;

  String? get icon_background_color => _icon_background_color;

  String? get icon_mask_base_uri => _icon_mask_base_uri;

  String? get name => _name;

  OpeningHours? get opening_hours => _opening_hours;

  List<Photos>? get photos => _photos;

  String? get place_id => _place_id;

  PlusCode? get plus_code => _plus_code;

  int? get price_level => _price_level;

  double? get rating => _rating;

  String? get reference => _reference;

  String? get scope => _scope;

  List<String>? get types => _types;

  int? get user_ratings_total => _user_ratings_total;

  String? get vicinity => _vicinity;

  //setters

  set vicinity(String? vicinity) {
    _vicinity = vicinity;
  }

  set user_ratings_total(int? _user_ratings_total) {
    _user_ratings_total = user_ratings_total;
  }

  set types(List<String>? types) {
    _types = types;
  }

  set scope(String? scope) {
    _scope = scope;
  }

  set reference(String? reference) {
    _reference = reference;
  }

  set rating(double? rating) {
    _rating = rating;
  }

  set price_level(int? price_level) {
    _price_level = price_level;
  }

  set plus_code(PlusCode? plus_code) {
    _plus_code = plus_code;
  }

  set place_id(String? place_id) {
    _place_id = place_id;
  }

  set photos(List<Photos>? photos) {
    _photos = photos;
  }

  set opening_hours(OpeningHours? opening_hours) {
    _opening_hours = opening_hours;
  }

  set name(String? name) {
    _name = name;
  }

  set icon_mask_base_uri(String? icon_mask_base_uri) {
    _icon_mask_base_uri = icon_mask_base_uri;
  }

  set icon_background_color(String? icon_background_color) {
    _icon_background_color = icon_background_color;
  }

  set icon(String? icon) {
    _icon = icon;
  }

  set geometry(Geometry? geometry) {
    _geometry = geometry;
  }

  set business_status(String? business_status) {
    _business_status = business_status;
  }

//setters


}