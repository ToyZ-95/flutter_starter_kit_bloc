import 'package:flutter/material.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';

enum SnackBarType {
  success,
  info,
  error,
}

class Utils {
  static showSnackbar({
    required BuildContext context,
    SnackBarType type = SnackBarType.info,
    Widget? contentWidget,
    String? message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: contentWidget ?? Text(message ?? ""),
        backgroundColor: _getSnackBarBGColor(type),
      ),
    );
  }

  static _getSnackBarBGColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return colorsConstants.successGreen;
      case SnackBarType.info:
        return colorsConstants.infoYellow;
      case SnackBarType.error:
        return colorsConstants.errorRed;
      default:
        return colorsConstants.infoYellow;
    }
  }
}
