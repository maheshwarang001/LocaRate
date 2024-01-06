import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:locale_loom_app/data/app_exception.dart';
import 'package:locale_loom_app/models/db_model/db_m.dart';
import 'package:locale_loom_app/models/googleapi/result_model.dart';
import 'package:locale_loom_app/models/request_params_model.dart';
import 'package:locale_loom_app/res/values/value_t.dart';
import 'package:locale_loom_app/services/database_service.dart';
import 'package:locale_loom_app/services/location_service.dart';
import 'package:locale_loom_app/utils/singelton/singelton_postion.dart';
import '../models/googleapi/place_model.dart';
import '../repository/request_repo/request_repo.dart';
import '../utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

// View Model for managing data and business logic related to search results
class ResultViewModel with ChangeNotifier {
  final _requestRepo = RequestRepository();

  // Lists to hold search results, frequent search words, and saved records
  List<Result> dataList = [];
  Map<String, int> map = {};
  List<String> frequentSearchedWord = [];
  List<Records> recordList = [];

  // Method to perform a search using Google Places API
  Future<void> searchApi(String keyword, int radius, BuildContext context) async {
    // Check for location permission
    if (SingletonPosition.getValue() == null) {
      throw NoPermissionException();
    }

    // Create request parameters
    ParamModel data = ParamModel();
    data.lat = SingletonPosition.getValue()!.latitude;
    data.lng = SingletonPosition.getValue()!.longitude;
    data.radius = radius;
    data.keyword = keyword;

    // Update the search frequency map
    _updateMap(keyword);

    try {
      // Call the API and update the data list
      Place apiData = await _requestRepo.getApi(data);
      if (dataList.isNotEmpty) {
        dataList.clear();
      }
      dataList.addAll(apiData.results ?? []);
      notifyListeners();
    } catch (err) {
      throw BadRequestException(err.toString());
    }
  }

  // Method to sort the data list based on rating
  void provideSort() {
    Utils.sortList(dataList, (result) => result.rating!);
    notifyListeners();
  }

  // Method to filter the data list based on opening hours
  void filterList() {
    Utils.filterList(dataList, (result) => result.opening_hours?.open_now! == true);
    notifyListeners();
  }

  // Method to update the search frequency map
  void _updateMap(String keyword) {
    map.update(
      keyword,
          (value) => value + 1,
      ifAbsent: () => 1,
    );

    // Notify listeners of changes
    notifyListeners();

    // Log information for debugging
    print("${frequentSearchedWord.length} size");
    print("${map.length} map length");
  }

  // Method to pull frequent search words from the search frequency map
  Future<void> pullFrequentSearchWord() async {
    if (frequentSearchedWord.isNotEmpty) frequentSearchedWord.clear();
    frequentSearchedWord.addAll(Utils.heapToGetMostSearched(map));
    frequentSearchedWord.reversed;
    notifyListeners();
  }

  // Method to save a record to the local database
  Future<void> saveItem(Records record) async {
    DataBaseService.add(record);
  }

  // Method to delete a record from the local database
  Future<void> deleteItem(Records record) async {
    DataBaseService.delete(record);
  }

  // Method to get all records from the local database
  List<Records> getAllItem() {
    DataBaseService.getAll().then((value) {
      print("${value.length} size of the array");
      if (recordList.isNotEmpty) recordList.clear();
      recordList = value;
    });
    notifyListeners();
    print("${recordList.length} size of the array");
    return recordList;
  }

}
