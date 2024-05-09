// ignore_for_file: use_build_context_synchronously

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/routers/navigation_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      childWidget: FlutterLogo(
        size: 200.sp,
      ),
      duration: const Duration(milliseconds: 1500),
      onEnd: () {
        String? accessToken = storageManager.getToken("access_token");
        if (accessToken.isNotEmpty) {
          moveToHomeScreen(context: context);
        } else {
          moveToLoginScreen(context: context);
        }
      },
      backgroundColor: colorsConstants.whiteColor,
    );
  }
}
