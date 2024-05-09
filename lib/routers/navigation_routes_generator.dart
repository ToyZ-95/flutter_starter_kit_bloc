import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/modules/home/views/home_screen.dart';
import 'package:starter_kit_bloc/modules/login/views/login.dart';
import 'package:starter_kit_bloc/modules/splash/views/splash_screen.dart';
import 'package:starter_kit_bloc/routers/extensions.dart';

class NavigationRoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final RouteScreens routeScreen = RouteScreens.values.firstWhereOrNull(
            (element) => element.name == routeSettings.name) ??
        RouteScreens.root;

    SettingArguments? args;
    if (routeSettings.arguments != null) {
      args = routeSettings.arguments as SettingArguments?;
    }

    switch (routeScreen) {
      case RouteScreens.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const SplashScreen();
          },
        );
      case RouteScreens.root:
      case RouteScreens.login:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Login();
          },
        );

      case RouteScreens.baseModule:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Placeholder();
          },
        );
      case RouteScreens.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        );
    }
  }
}
