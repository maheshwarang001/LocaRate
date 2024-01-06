import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/db_model/db_m.dart';
import '../../viewmodels/result_viewmodel.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/search_bar_widget.dart';

// Define the home page as a stateless widget
class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  // Build method for the home page
  @override
  Widget build(BuildContext context) {
    // Obtain the instance of the ResultViewModel using the Provider
    final resultViewModel = Provider.of<ResultViewModel>(context);

    // Scaffold widget for the overall structure of the page
    return Scaffold(
      appBar: CustomAppBar(), // Custom app bar widget
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchBar(
            resultViewModel,
            top: 40,
            left: 20,
            right: 20,
            radius: 15,
            shouldNavigate: true,
          ), // Custom search bar widget
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Frequent Search'), // Title for frequent search
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FutureBuilder(
                    future: resultViewModel.pullFrequentSearchWord(),
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the future is complete, show the frequent search list
                        return Consumer<ResultViewModel>(
                          builder: (context, resultViewModel, child) {
                            return Container(
                              height: 100,
                              child: (resultViewModel.frequentSearchedWord.isEmpty)
                                  ? Center(child: Text("No history available"))
                                  : ListView.builder(
                                itemCount: resultViewModel.frequentSearchedWord.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(resultViewModel.frequentSearchedWord[index]),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        // If the future is not complete, show a loading indicator
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Consumer<ResultViewModel>(
            builder: (context, resultViewModel, child) {
              return HorizontalScrollListView(resultViewModel: resultViewModel);
            },
          ),
        ],
      ),
    );
  }
}

// Widget for a horizontal scrolling list view
class HorizontalScrollListView extends StatelessWidget {
  final ResultViewModel resultViewModel;

  const HorizontalScrollListView({Key? key, required this.resultViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If there are items in the list, show a horizontal scrollable list
    if (resultViewModel.getAllItem().isNotEmpty) {
      return Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: resultViewModel.recordList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardWidget(
                product: resultViewModel.recordList[index],
                viewModel: resultViewModel,
              ),
            );
          },
        ),
      );
    } else {
      // If the list is empty, show a message
      return Text('No data available');
    }
  }
}

// Widget for displaying individual card details
class CardWidget extends StatelessWidget {
  final Records product;
  final ResultViewModel viewModel;

  CardWidget({required this.product, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Card widget with specific styling
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductDetails(context), // Build product details
          ],
        ),
      ),
    );
  }

  // Widget for building product details
  Widget _buildProductDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                product.name!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            'Rating: ${product.rating ?? 'N/A'}',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          const Icon(
            Icons.location_on,
            color: Colors.blue,
          ),
          Text(
            'Address: ${product.address ?? 'N/A'}',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
