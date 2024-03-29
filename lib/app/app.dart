import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_flutter_app/presentation/resources/routes_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/theme_manager.dart';
import 'package:mvvm_flutter_app/testing.dart';

class MyApp extends StatefulWidget {
  int appState = 0;

  MyApp._sharedInstance();

  static final MyApp instance = MyApp._sharedInstance();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          home: const TestScreen(),
          theme: getApplicationTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
        );
      },
    );
  }
}
