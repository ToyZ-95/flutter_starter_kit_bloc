part of 'home_screen_bloc.dart';

class HomeScreenEvent {
  NavigationBarItems currentNavigationBarItem = NavigationBarItems.dashboard;
}

class LoadUserEvent extends HomeScreenEvent {}

class ChangeNavigationBarItemEvent extends HomeScreenEvent {
  ChangeNavigationBarItemEvent(
      {required NavigationBarItems selectedBaseScreen}) {
    currentNavigationBarItem = selectedBaseScreen;
  }
}
