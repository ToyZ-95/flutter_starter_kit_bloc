import 'package:flutter/material.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/routers/extensions.dart';

moveToLoginScreen({required BuildContext context}) {
  context.operation(
    operation: NavigationOperations.pushReplacementNamed,
    routeScreen: RouteScreens.login,
  );
}

moveToHomeScreen({required BuildContext context}) {
  context.operation(
    operation: NavigationOperations.pushReplacementNamed,
    routeScreen: RouteScreens.homeScreen,
  );
}

moveToBaseModuleScreen({required BuildContext context}) {
  context.operation(
    operation: NavigationOperations.pushReplacementNamed,
    routeScreen: RouteScreens.baseModule,
  );
}
