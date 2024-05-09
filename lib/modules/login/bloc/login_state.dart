part of 'login_bloc.dart';

class LoginState {
  ApiResponse? errorData;
}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginErrorState extends LoginState {
  LoginErrorState({required ApiResponse errorData}) {
    this.errorData = errorData;
  }
}
