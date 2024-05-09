abstract class Serializable {
  Map<String, dynamic> toJson();
}

class RequestHeaders<T extends Serializable> {
  String? auth;
  String? stateToken;
  String? contentType;
  String? accept;
  // String? language = sharedPreferences.currentLanguageCode ?? 'en';
  // String? userId = sharedPreferences.userID ?? '';

  RequestHeaders(
      {this.auth = 'auth',
      this.stateToken = 'stateToken',
      this.contentType = 'application/json',
      // this.userId,
      // this.language,
      this.accept = 'text/plain'});

  RequestHeaders.fromMap(Map map)
      : this(
            auth: map['Authorization'],
            contentType: map['Content-Type'],
            stateToken: map['stateToken'],
            // language: map['language'],
            // userId: map['userId'],
            accept: map['accept']);

  Map<String, dynamic> toJson() => {
        'Authorization': auth,
        'Content-Type': contentType,
        // 'language': language,
        'stateToken': stateToken,
        // 'userId': userId,
        'accept': accept,
      };

  // Map<String, dynamic> removeNullElement() {
  //   return toJson().removeNullAndEmptyParams();
  // }
}
