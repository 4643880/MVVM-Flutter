import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/testing.dart';

class MyApp extends StatelessWidget {
  // Named Constructor
  MyApp._sharedInstance() {}

  static final MyApp _instance = MyApp._sharedInstance();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
    );
  }
}
