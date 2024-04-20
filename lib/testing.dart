import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/app/app.dart';
import 'package:mvvm_flutter_app/presentation/resources/colors_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/fonts_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/styles_manager.dart';

// Differences
// => AuthenticationResponse =  User

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  void updateAppState() {
    MyApp.instance.appState = 2;
    print(MyApp.instance.appState.toString());
  }

  @override
  Widget build(BuildContext context) {
    updateAppState();
    return Scaffold(
      body: Center(
        child: Text(
          "Test Screen",
          style: AppTextStyleManager.getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.kFontSize16,
          ),
        ),
      ),
    );
  }
}
