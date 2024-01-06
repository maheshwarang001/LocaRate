import 'package:flutter/material.dart';
import 'package:locale_loom_app/views/screens/result_list_page.dart';
import 'package:locale_loom_app/utils/routes/routes_name.dart';

import '../utils/routes/route.dart';

class DarkModeButton extends StatelessWidget{
  const DarkModeButton({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(


        child: Container(
            margin: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: const Icon(
              Icons.dark_mode_outlined,
              size: 30,
              color: Colors.black,
            )));
  }

}