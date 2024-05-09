import 'package:dio/dio.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, dynamic> headers = <String, dynamic>{};

    headers = iAppHeaders!.toMap();

    headers["Authorization"] =
        "Bearer ${storageManager.getToken('access_token')}";

    // String token = await sharedPreferences.getUserToken() ?? "";

    // headers.putIfAbsent("Azure-AD-Token", () => token);

    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }
}
