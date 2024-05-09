import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';

class DashboardRepository {
  Future<ApiResponse> fetchProducts(
      {required int offset, required int limit}) async {
    Map<String, dynamic> queryParams = {"offset": offset, "limit": limit};

    ApiResponse apiResponse = await networkManager.callAPI(
        endpoint: apiEndPoints.getProducts, queryParameters: queryParams);
    return apiResponse;
  }
}
