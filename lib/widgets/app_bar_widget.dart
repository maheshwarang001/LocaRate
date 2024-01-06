import 'package:flutter/material.dart';
import 'package:locale_loom_app/res/values/app_strings.dart';
import 'package:locale_loom_app/widgets/dark_mode_button.dart';

// CustomAppBar class definition
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  // Override the preferredSize property to define the preferred height of the app bar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  // Build method to create the AppBar
  @override
  Widget build(BuildContext context) {
    // AppBar widget with a title, elevation, and actions (DarkModeButton)
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
      actions: const [DarkModeButton()],  // Assuming DarkModeButton is a custom widget
    );
  }
}
