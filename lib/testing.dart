import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/app/app.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  void updateAppState() {
    MyApp.instance.appState = 2;
    print(MyApp.instance.appState.toString());
  }

  @override
  Widget build(BuildContext context) {
    updateAppState();
    return const Scaffold(
      body: Center(
        child: Text("Test Screen"),
      ),
    );
  }
}
