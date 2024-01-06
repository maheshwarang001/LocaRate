import 'dart:convert';
import 'package:http/http.dart';
import 'package:locale_loom_app/data/app_exception.dart';
import 'package:locale_loom_app/data/network/abstract_api_service.dart';
import 'package:locale_loom_app/models/googleapi/place_model.dart';
import 'package:locale_loom_app/models/request_params_model.dart';
import 'package:locale_loom_app/res/values/app_strings.dart';

// Class implementing the abstract API service for network requests
class NetworkApiService extends AbstractApiService {

  // Dynamic variable to store the JSON response
  dynamic responseJson;

  @override
  Future<Place> getApiResponse(String baseUrl, String path, String apiKey, ParamModel paramModel) async {
    // Check if required parameters are valid; throw BadRequestException if not
    if (apiKey.isEmpty ||
        paramModel.lat == null ||
        paramModel.lng == null ||
        paramModel.keyword!.isEmpty ||
        paramModel.radius! < 100) {
      throw BadRequestException();
    }

    Place responseJson;

    // Build query parameters for the API request
    Map<String, String> queryParams = {
      'location': '${paramModel.lat},${paramModel.lng}',
      'radius': paramModel.radius.toString(),
      'keyword': paramModel.keyword!,
      'key': apiKey,
    };

    try {
      // Construct URI and make GET request with a timeout of 5 seconds
      Uri uri = Uri.https(baseUrl, path, queryParams);
      print(uri.toString());
      Response res = await get(uri).timeout(Duration(seconds: 5));

      // Process the response
      responseJson = returnResponse(res);
    } catch (err) {
      // Handle and rethrow exception for failed API request
      throw FetchDataException(err.toString());
    }

    return responseJson;
  }

  // Method to process the HTTP response and return a Place object
  Place returnResponse(Response res) {
    switch (res.statusCode) {
      case 200:
        print(res.body.toString());
        Map<String, dynamic> json = jsonDecode(res.body);
        Place p = Place.fromJson(json);
        return p;

      case 404:
      // Throw BadRequestException for 404 status code
        throw BadRequestException(AppStrings.dynamicError + res.statusCode.toString());
      default:
      // Throw FetchDataException for other status codes
        throw FetchDataException(AppStrings.dynamicError + res.statusCode.toString());
    }
  }
}
