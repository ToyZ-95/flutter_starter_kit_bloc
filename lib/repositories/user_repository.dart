import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';

class UserRepository {
  Future<ApiResponse> getUserProfile() async {
    ApiResponse apiResponse =
        await networkManager.callAPI(endpoint: apiEndPoints.getUserProfile);
    return apiResponse;
  }
}
