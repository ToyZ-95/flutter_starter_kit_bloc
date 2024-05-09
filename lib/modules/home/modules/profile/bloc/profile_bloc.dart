import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/routers/navigation_helper.dart';
import 'package:starter_kit_bloc/utils/utils.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<LogOutEvent>(_onLogOut);
  }

  FutureOr<void> _onLogOut(
      LogOutEvent event, Emitter<ProfileState> emit) async {
    if (await storageManager.clear()) {
      emit(LoggedOutState());
    } else {
      print("Not logged out");
    }
  }
}
