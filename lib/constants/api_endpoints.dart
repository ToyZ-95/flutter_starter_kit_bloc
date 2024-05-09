abstract class IApiEndPoints {
  factory IApiEndPoints.getInstance() => ApiEndPoints();

  String get baseURL;
  String get login;
  String get getUserProfile;
  String get getProducts;
}

class ApiEndPoints implements IApiEndPoints {
  @override
  String get baseURL =>
      "https://api.escuelajs.co/api/v1"; // "https://dummyjson.com";

  @override
  String get login => "$baseURL/auth/login";

  @override
  String get getUserProfile => "$baseURL/auth/profile";

  @override
  String get getProducts => "$baseURL/products";
}
