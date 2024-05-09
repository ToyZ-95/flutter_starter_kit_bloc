import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/models/generic_response_model.dart';
import 'package:starter_kit_bloc/models/user_model.dart';
import 'package:starter_kit_bloc/modules/home/views/home_screen.dart';
import 'package:starter_kit_bloc/repositories/user_repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  UserRepository userRepository;

  NavigationBarItems selectedNavigationBarItem = NavigationBarItems.dashboard;

  HomeScreenBloc({required this.userRepository}) : super(HomeScreenInitial()) {
    on<HomeScreenEvent>(_onHomeScreenEvent);
    on<ChangeNavigationBarItemEvent>(_onChangeNavigationBarItem);
  }

  Future<void> _onHomeScreenEvent(
      HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingUserProfileState());

    ApiResponse apiResponse = await userRepository.getUserProfile();
    if (apiResponse.statusCode == 200) {
      UserModel userModel = UserModel.fromMap(apiResponse.data);
      storageManager.setUserModel(userModel);
      emit(UserProfileLoadedState());
    } else {
      LoadingUserProfileErrorState(errorData: apiResponse);
    }
  }

  FutureOr<void> _onChangeNavigationBarItem(
      ChangeNavigationBarItemEvent event, Emitter<HomeScreenState> emit) {
    selectedNavigationBarItem = event.currentNavigationBarItem;

    emit(SelectedNavigationBarItemChangedState());
  }
}
