import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/enums/enums.dart';
import 'package:starter_kit_bloc/repositories/user_repository.dart';
import 'package:starter_kit_bloc/routers/navigation_routes_generator.dart';

void main() async {
  //Fixes fintale thing
  WidgetsFlutterBinding.ensureInitialized();
  await initialBaseSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return RepositoryProvider(
          create: (context) => UserRepository(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            initialRoute: RouteScreens.splash.name,
            onGenerateRoute: NavigationRoutesGenerator.onGenerateRoute,
          ),
        );
      },
    );
  }
}
