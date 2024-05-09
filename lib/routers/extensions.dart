import 'package:flutter/material.dart';
import 'package:starter_kit_bloc/enums/enums.dart';

// extension NavigationOperations on BuildContext {
//   Object operation({required RouteScreens routeScreen}) {
//     return Navigator.of(this).pushNamed(routeScreen.name);
//   }
// }

class SettingArguments {
  // PageTransitionType? animationType;
  Object? argumentsData;
  SettingArguments({this.argumentsData});
}

enum NavigationOperations {
  pushNamed,
  pushReplacementNamed,
  pushNamedAndRemoveUntil,
  pop,
}

extension EnumNavigationOperations on BuildContext {
  Object operation(
      {required RouteScreens routeScreen,
      NavigationOperations operation = NavigationOperations.pushNamed,
      String? pushNamedAndRemoveUntilRouteName,
      SettingArguments? settings,
      Function(dynamic)? revertCallback}) {
    Object? arguments;
    arguments = settings ?? SettingArguments(argumentsData: null);
    switch (operation) {
      case NavigationOperations.pushNamed:
        return Navigator.of(this)
            .pushNamed(routeScreen.name, arguments: arguments)
            .then((value) => revertCallback?.call(value));
      case NavigationOperations.pushReplacementNamed:
        return Navigator.of(this)
            .pushReplacementNamed(routeScreen.name, arguments: arguments)
            .then((value) => revertCallback?.call(value));
      case NavigationOperations.pushNamedAndRemoveUntil:
        return Navigator.of(this).pushNamedAndRemoveUntil(routeScreen.name,
            (route) {
          if (pushNamedAndRemoveUntilRouteName == null ||
              pushNamedAndRemoveUntilRouteName.isEmpty) {
            return route.isFirst;
          }
          return route.settings.name == pushNamedAndRemoveUntilRouteName;
        }, arguments: arguments).then((value) => revertCallback?.call(value));
      case NavigationOperations.pop:
        return Navigator.of(this).pop;
    }
  }
}
