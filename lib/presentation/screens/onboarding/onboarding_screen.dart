import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/presentation/resources/colors_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Text("Welcome to on baording"),
      ),
    );
  }
}
