import 'package:flutter/material.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/routers/extensions.dart';

moveToLoginScreen({required BuildContext context}) {
  context.operation(
    operation: NavigationOperations.pushReplacementNamed,
    routeScreen: RouteScreens.login,
  );
}

moveToHomeScreen(
    {required BuildContext context,
    dynamic Function(dynamic)? revertCallback}) {
  context.operation(
    operation: NavigationOperations.pushReplacementNamed,
    routeScreen: RouteScreens.homeScreen,
    revertCallback: (dynamic data) {
      revertCallback?.call(data);
    },
  );
}

moveToBaseModuleScreen({required BuildContext context}) {
  context.operation(
    operation: NavigationOperations.pushReplacementNamed,
    routeScreen: RouteScreens.baseModule,
  );
}

moveToDetailsScreen(
    {required BuildContext context,
    dynamic Function(dynamic)? revertCallback}) {
  context.operation(
    operation: NavigationOperations.pushNamed,
    routeScreen: RouteScreens.details,
    revertCallback: (dynamic data) {
      revertCallback?.call(data);
    },
  );
}
