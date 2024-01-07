import 'package:flutter/material.dart';
import 'package:locale_loom_app/utils/app_colors.dart';
import 'package:locale_loom_app/utils/app_strings.dart';

class CustomSearchBar{

  Widget searchField(){
    return Column(

      children: [
        Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(CustomColors.darkTint).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0
              )
            ]
          ),
          child:  TextField(

            decoration: InputDecoration(
              hintText: AppStrings.searchbar,
              hintStyle: const TextStyle(
                color: Color(CustomColors.lightGrey),
                fontSize: 14
              ),
              filled: true,
              fillColor: Colors.white,

              prefixIcon: const Icon(
                Icons.search_outlined,
                size: 25,
                color: Colors.grey
              ),

              suffixIcon: Container(
                width: 100,
                margin: EdgeInsets.only(right: 10),
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
                          color: Colors.grey
                        ),
                      ],
                    ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        )
      ],
    );
  }
}