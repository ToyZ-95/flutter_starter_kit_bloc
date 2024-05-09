part of 'home_screen_bloc.dart';

class HomeScreenState {
  ApiResponse? errorData;
}

final class HomeScreenInitial extends HomeScreenState {}

final class LoadingUserProfileState extends HomeScreenState {}

final class UserProfileLoadedState extends HomeScreenState {}

final class LoadingUserProfileErrorState extends HomeScreenState {
  LoadingUserProfileErrorState({required ApiResponse errorData}) {
    this.errorData = errorData;
  }
}

final class SelectedNavigationBarItemChangedState extends HomeScreenState {}
