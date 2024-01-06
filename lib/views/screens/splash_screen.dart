import 'package:flutter/material.dart';
import 'package:locale_loom_app/res/values/app_strings.dart';
import 'package:locale_loom_app/utils/routes/routes_name.dart';
import 'package:locale_loom_app/utils/utils.dart';
import 'package:locale_loom_app/viewmodels/splashscreen_viewmodel.dart';
import 'package:provider/provider.dart';

// Define the SplashScreen as a stateless widget
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // Build method for the SplashScreen
  @override
  Widget build(BuildContext context) {
    // Obtain the instance of the SplashScreenViewModel using the Provider
    final splashScreenViewModel = Provider.of<SplashScreenViewModel>(context, listen: false);

    // Initialize location client and transition to the home screen
    splashScreenViewModel.getLocationClient(context);
    Utils.transition(context, 5, RoutesName.home);

    // Scaffold widget for the overall structure of the splash screen
    return const Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
