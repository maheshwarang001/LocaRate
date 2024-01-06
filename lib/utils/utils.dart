import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locale_loom_app/models/googleapi/result_model.dart';
import 'package:locale_loom_app/utils/frequent/frequent_search.dart';
import 'package:locale_loom_app/utils/routes/routes_name.dart';
import 'package:locale_loom_app/views/screens/home_page.dart';

import '../services/location_service.dart';

// Utility class containing commonly used functions
class Utils {

  // Method to show a styled toast message
  static showToastMessage(String? message, {required BuildContext context}) {
    showToast(
      message ?? 'Normal Exception Occurred',
      context: context,
      animation: StyledToastAnimation.slideFromBottom,
      duration: const Duration(milliseconds: 2000),
    );
  }

  // Method to transition to a new screen after a specified delay
  static void transition(BuildContext context, int time, String page) {
    Future.delayed(Duration(seconds: time), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  // Method to sort a list based on a selector function
  static List<T> sortList<T>(List<T> data, Comparable Function(T) selector) {
    data.sort((a, b) => selector(b).compareTo(selector(a)));
    return data;
  }

  // Method to filter a list based on a condition function
  static List<T> filterList<T>(List<T> list, bool Function(T) condition) {
    return list.where(condition).toList();
  }

  // Method to convert a heap map to a list of most searched strings
  static List<String> heapToGetMostSearched(Map<String, int> map) {
    FrequentSearch.fillTheHeap(map);
    return FrequentSearch.sendValueToList();
  }
}
