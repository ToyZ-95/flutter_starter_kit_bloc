import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/models/user_model.dart';

abstract class IStorageManager {
  factory IStorageManager.getInstance() => StorageManager();

  Future<void> init();

  Future<void> setToken({required String tokenType, required String token});

  String getToken(String tokenType);

  bool getIsFirstLaunch();

  Future<void> setUserModel(UserModel userModel);

  UserModel? get userModel;

  Future<void> setIsFirstLaunch({required bool isFirstLaunch});

  Future<bool> clear();
}

class StorageManager implements IStorageManager {
  SharedPreferences? sharedPreferences;

  UserModel? _userModel;

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  bool getIsFirstLaunch() {
    return sharedPreferences?.getBool('isFirstLaunch') ?? true;
  }

  @override
  Future<void> setIsFirstLaunch({required bool isFirstLaunch}) async {
    await sharedPreferences?.setBool('isFirstLaunch', isFirstLaunch);
  }

  @override
  String getToken(String tokenType) {
    return sharedPreferences?.getString(tokenType) ?? "";
  }

  @override
  Future<void> setToken(
      {required String tokenType, required String token}) async {
    await sharedPreferences?.setString(tokenType, token);
  }

  @override
  Future<void> setUserModel(UserModel userModel) async {
    _userModel = userModel;
    await sharedPreferences?.setString("user_model", userModel.toJson());
  }

  UserModel? _getUserModel() {
    String? userModelString = sharedPreferences?.getString("user_model");
    if (userModelString != null) {
      _userModel = UserModel.fromJson(userModelString);
      return _userModel;
    }
    return null;
  }

  @override
  UserModel? get userModel => _userModel ?? _getUserModel();

  @override
  Future<bool> clear() async {
    _userModel = null;
    return await sharedPreferences?.clear() ?? false;
  }
}
