import 'package:flutter/material.dart';
import 'package:locale_loom_app/utils/app_strings.dart';
import 'package:locale_loom_app/widgets/dark_mode_button.dart';

class CustomAppBar {
  AppBar buildAppBar() {
    return AppBar(
      title: Container(
        margin: EdgeInsets.all(10),
        child: const Text(
          AppStrings.appName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 1,
      actions: [DarkModeButton().darkMode()],
    );
  }
}
