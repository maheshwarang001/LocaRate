import 'package:locale_loom_app/models/googleapi/place_model.dart';
import 'package:locale_loom_app/models/request_params_model.dart';

// Abstract class defining the contract for API service
abstract class AbstractApiService {

  // Method signature for making API requests and receiving place data
  Future<Place> getApiResponse(String baseUrl, String path, String apiKey, ParamModel param);
}
