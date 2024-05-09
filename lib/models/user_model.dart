import 'dart:convert';

class UserModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (role != null) {
      result.addAll({'role': role});
    }
    if (avatar != null) {
      result.addAll({'avatar': avatar});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      email: map['email'],
      password: map['password'],
      name: map['name'],
      role: map['role'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
