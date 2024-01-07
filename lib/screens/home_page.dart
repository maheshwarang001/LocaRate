import 'package:flutter/material.dart';
import 'package:locale_loom_app/utils/app_strings.dart';
import 'package:locale_loom_app/widgets/app_bar_widget.dart';
import 'package:locale_loom_app/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().buildAppBar(),
      body:
      Column(
        children: [
          CustomSearchBar().searchField(),

        ],
      ),
    );
  }




}
