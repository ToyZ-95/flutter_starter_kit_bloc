import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';
import 'package:starter_kit_bloc/modules/login/repositories/login_repository.dart';
import 'package:starter_kit_bloc/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    ApiResponse apiResponse = await loginRepository.signIn(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    );

    if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
      await storageManager.setToken(
        tokenType: "access_token",
        token: apiResponse.data["access_token"],
      );
      await storageManager.setToken(
        tokenType: "refresh_token",
        token: apiResponse.data["refresh_token"],
      );

      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(errorData: apiResponse));
    }
  }
}
