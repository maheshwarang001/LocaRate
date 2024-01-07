import 'package:flutter/material.dart';

class DarkModeButton{
  GestureDetector darkMode() {
    return GestureDetector(
        onTap: (){

        },
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