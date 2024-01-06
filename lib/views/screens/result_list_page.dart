
import 'package:flutter/material.dart';
import 'package:locale_loom_app/widgets/card_widget.dart';
import 'package:locale_loom_app/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../models/googleapi/result_model.dart';
import '../../viewmodels/result_viewmodel.dart';

// Define the ResultListPage as a stateless widget
class ResultListPage extends StatelessWidget {
  ResultListPage({Key? key}) : super(key: key);

  // Build method for the ResultListPage
  @override
  Widget build(BuildContext context) {
    // Obtain the instance of the ResultViewModel using the Provider
    final requestViewModel = Provider.of<ResultViewModel>(context);

    // Scaffold widget for the overall structure of the page
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomSearchBar(
          requestViewModel,
          top: 5,
          left: 5,
          right: 5,
          radius: 50,
          shouldNavigate: false,
        ),
        toolbarHeight: 100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sorting and Filtering options
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    requestViewModel.provideSort();
                  },
                  child: Text(
                    "Rating",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    requestViewModel.filterList();
                  },
                  child: Text(
                    "Open",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          // Display data or a message if there's no data
          if (requestViewModel.dataList.isEmpty)
            Center(child: Text("No Data Available"))
          else
            Expanded(
              child: ListView.builder(
                itemCount: requestViewModel.dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  // Display each item using the CardWidget
                  return CardWidget(
                    product: requestViewModel.dataList[index],
                    viewModel: requestViewModel,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
