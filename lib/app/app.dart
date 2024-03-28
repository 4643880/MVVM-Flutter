import 'package:flutter/material.dart';
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
    return const MaterialApp(
      home: TestScreen(),
    );
  }
}
