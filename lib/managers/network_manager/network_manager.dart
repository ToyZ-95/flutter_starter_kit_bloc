import 'package:dio/dio.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/managers/network_manager/api_calls_interceptor.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';

class NetworkManager {
  final Dio _dio = Dio()
    ..interceptors.add(AppInterceptors())
    ..options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        //requestEncoder:gzipEncoder,
        validateStatus: (status) {
          return status! < 500;
        });

  Future<ApiResponse> callAPI({
    RequestType requestType = RequestType.get,
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    switch (requestType) {
      case RequestType.get:
        return await _get(endpoint: endpoint, queryParameters: queryParameters);
      case RequestType.post:
        return await _post(
            endpoint: endpoint, queryParameters: queryParameters, body: body);
      default:
        return await _get(endpoint: endpoint, queryParameters: queryParameters);
    }
  }

  Future<ApiResponse> _get(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    Response dioResponse =
        await _dio.get(endpoint, queryParameters: queryParameters);

    return ApiResponse()
      ..statusCode = dioResponse.statusCode
      ..message = dioResponse.statusMessage
      ..data = dioResponse.data;
  }

  Future<ApiResponse> _post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response dioResponse =
        await _dio.post(endpoint, queryParameters: queryParameters, data: body);

    return ApiResponse()
      ..statusCode = dioResponse.statusCode
      ..message = dioResponse.statusMessage
      ..data = dioResponse.data;
  }
}
