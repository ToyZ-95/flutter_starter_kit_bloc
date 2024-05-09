abstract class IAppHeaders {
  factory IAppHeaders.getInstance() => AppHeaders();
  String get appHeadersContentTypeKey;
  String get appHeadersContentTypeValue;
  String get appHeadersCharsetKey;
  String get appHeadersCharsetValue;
  String get appHeadersContentTypeFormEncodedValue;
  String get appHeadersAcceptTypeKey;
  String get appHeadersAuthorization;
  String get appHeadersBearer;

  Map<String, dynamic> toMap();
}

class AppHeaders implements IAppHeaders {
  @override
  String get appHeadersContentTypeKey => "Content-Type";

  @override
  String get appHeadersContentTypeValue => "application/json";

  @override
  String get appHeadersCharsetKey => "Charset";

  @override
  String get appHeadersCharsetValue => "utf-8";

  @override
  String get appHeadersContentTypeFormEncodedValue =>
      "application/x-www-form-urlencoded";

  @override
  String get appHeadersAcceptTypeKey => "Accept";

  @override
  String get appHeadersAuthorization => "Accept";

  @override
  String get appHeadersBearer => "Bearer";

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> headersMap = {};

    headersMap[appHeadersContentTypeKey] = "application/json";

    return headersMap;
  }
}
