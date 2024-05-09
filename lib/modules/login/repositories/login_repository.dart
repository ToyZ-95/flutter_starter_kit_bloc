import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';

class LoginRepository {
  Future<ApiResponse> signIn({
    required String email,
    required String password,
  }) async {
    ApiResponse apiResponse = await networkManager.callAPI(
      endpoint: apiEndPoints.login,
      requestType: RequestType.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    return apiResponse;
  }
}
