import 'package:locale_loom_app/models/googleapi/result_model.dart';

class Place{
  List<String>? _htmlAttributions;
  String? _nextPageToken;
  List<Result>? _results;
  String? _status;


  Place();

 // Getter Methods
  List<String>? get htmlAttributions => _htmlAttributions;

  String? get nextPageToken => _nextPageToken;

  List<Result>? get results => _results;

  String? get status => _status;

  //map

  Place.fromJson(Map<String, dynamic> json) {
    _htmlAttributions = json['html_attributions']?.cast<String>() ?? [];
    _nextPageToken = json['next_page_token'];
    _results = (json['results'] as List<dynamic>?)
        ?.map((resultJson) => Result.fromJson(resultJson))
        .toList()
        .cast<Result>();
    _status = json['status'];
  }



  // Setter Methods

  set nextPageToken(String? nextPageToken) {
    this._nextPageToken = nextPageToken;
  }

  set htmlAttributions(List<String>? htmlAttributions){
    this._htmlAttributions = htmlAttributions;
  }

  set results(List<Result>? results) {
    this._results = results;
  }

  set status(String? status) {
    this._status = status;
  }


}