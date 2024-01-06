import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locale_loom_app/utils/routes/routes_name.dart';
import 'package:locale_loom_app/views/screens/splash_screen.dart';

import '../../views/screens/home_page.dart';
import '../../views/screens/result_list_page.dart';


// Class responsible for generating and managing app routes
class Routes {
  // Method to generate routes based on the provided settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return navigationPage(HomePage()); // Navigate to Home page

      case RoutesName.splashScreen:
        return navigationPage(SplashScreen()); // Navigate to SplashScreen

      case RoutesName.searchResult:
        return navigationPage(ResultListPage()); // Navigate to ResultListPage

      default:
        return navigationPage(HomePage()); // Navigate to Home page by default
    }
  }

  // Method to create a MaterialPageRoute for the given widget
  static Route<dynamic> navigationPage(Widget value) {
    return MaterialPageRoute(builder: (BuildContext context) => value);
  }
}

