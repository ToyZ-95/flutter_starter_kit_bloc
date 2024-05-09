class ApiResponse {
  int? statusCode;
  bool? success;
  String? message;
  dynamic data;
  ApiResponse({this.statusCode, this.success, this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      statusCode: json["statusCode"],
      success: json["isSuccess"],
      message: json["message"],
      data: json["data"],
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data,
      };
}
