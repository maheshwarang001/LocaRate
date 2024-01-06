import 'package:locale_loom_app/data/network/abstract_api_service.dart';
import 'package:locale_loom_app/data/network/network_api_service.dart';
import 'package:locale_loom_app/models/googleapi/result_model.dart';
import 'package:locale_loom_app/models/request_params_model.dart';
import 'package:locale_loom_app/res/api_url/endpoints.dart';

import '../../models/googleapi/place_model.dart';

// Repository class responsible for making API requests
class RequestRepository {

  // Instance of the abstract API service
  final AbstractApiService _apiService = NetworkApiService();

  // Method to make an API request and retrieve place data
  Future<Place> getApi(ParamModel data) async {
    Place response;
    try {
      // Make an API request using the network API service
      response = await _apiService.getApiResponse(
        Endpoints.baseUrl,
        Endpoints.pathNearby,
        Endpoints.key,
        data,
      );
    } catch (e) {
      // Re-throw any exception encountered during the API request
      rethrow;
    }

    return response;
  }
}