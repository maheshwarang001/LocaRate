
import 'package:flutter/material.dart';
import 'package:locale_loom_app/models/db_model/db_m.dart';
import 'package:locale_loom_app/models/googleapi/result_model.dart';
import 'package:locale_loom_app/res/values/app_strings.dart';
import 'package:locale_loom_app/utils/utils.dart';
import 'package:locale_loom_app/viewmodels/result_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';


// Widget class representing a card displaying product details
class CardWidget extends StatelessWidget {
  final Result product;
  final ResultViewModel viewModel;

  // Constructor for the CardWidget
  const CardWidget({
    Key? key,
    required this.product,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Card Widget containing product details
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconContainer(),  // Container with an icon
            const SizedBox(width: 20),
            Expanded(
              child: _buildProductDetails(context),  // Product details section
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the icon container
  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.ac_unit_rounded,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  // Widget to build the product details
  Widget _buildProductDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductName(context),  // Product name section
        IntrinsicHeight(
          child: Row(
            children: [
              _buildStarRating(),  // Star rating section
              _buildDistance(),  // Distance information section
            ],
          ),
        ),
        Text(product.vicinity ?? 'N/A'),  // Vicinity information
      ],
    );
  }

  // Widget to build the product name section
  Widget _buildProductName(BuildContext context) {
    return Row(
      children: [

        Text(
            product.name ?? AppStrings.dynamicError,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

        const Spacer(),
        GestureDetector(
          onTap: () {
            Utils.showToastMessage("Saved to Fav", context: context);
            viewModel.saveItem(Records(
              product.name,
              product.vicinity,
              product.geometry?.location?.lat!,
              product.geometry?.location?.lng!,
              '',
              product.rating!.toString(),
              DateTime.now().toString(),
            ));
          },
          child: const Icon(
            Icons.favorite_border,
            color: Colors.cyan,
          ),
        ),
      ],
    );
  }

  // Widget to build the star rating section
  Widget _buildStarRating() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.black12,
        ),
        const SizedBox(width: 5),
        Text(product.rating.toString() ?? 'N/A'),
        const SizedBox(width: 5),
        Text('(${product.user_ratings_total?.toString() ?? 'N/A'})'),
      ],
    );
  }

  // Widget to build the distance information section
  Widget _buildDistance() {
    return const Expanded(
      child: Row(
        children: [
          VerticalDivider(
            color: Colors.black,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          Text('30 mins away'),
        ],
      ),
    );
  }
}

