import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/presentation/resources/assets_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/colors_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
