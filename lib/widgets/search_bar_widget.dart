import 'package:flutter/material.dart';
import 'package:locale_loom_app/repository/request_repo/request_repo.dart';
import 'package:locale_loom_app/res/values/app_colors.dart';
import 'package:locale_loom_app/res/values/app_strings.dart';
import 'package:locale_loom_app/utils/routes/routes_name.dart';
import 'package:locale_loom_app/utils/utils.dart';

import '../viewmodels/result_viewmodel.dart';

class CustomSearchBar extends StatelessWidget {
  final double top, left, right, radius;
  final bool shouldNavigate;
  final ResultViewModel? resultViewModel;

  // Use named parameters for better clarity
  CustomSearchBar(this.resultViewModel,{
    required this.top,
    required this.left,
    required this.right,
    required this.radius,
    required this.shouldNavigate,
    Key? key,
  }) : super(key: key);

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: top, left: left, right: right),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(CustomColors.darkTint).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0,
              )
            ],
          ),
          child: TextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            onSubmitted: (String value) {
              if (_searchController.text.isNotEmpty && shouldNavigate) {

                Navigator.pushNamed(context, RoutesName.searchResult);
                resultViewModel?.searchApi(_searchController.text,500,context);
                // resultViewModel?.notifyListeners();

              } else if ( !_searchController.text.isEmpty) {
                // Handle other cases if needed
                resultViewModel?.searchApi(_searchController.text,500,context);
                // resultViewModel?.notifyListeners();

              } else {
                Utils.showToastMessage("Search Something!", context: context);
              }
            },
            decoration: InputDecoration(
              hintText: AppStrings.searchbar,
              hintStyle: const TextStyle(
                color: Color(CustomColors.lightGrey),
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.search_outlined,
                size: 25,
                color: Colors.grey,
              ),
              suffixIcon: Container(
                width: 100,
                margin: const EdgeInsets.only(right: 10),
                child: const IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Icon(
                        Icons.filter_list,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
  }
}
