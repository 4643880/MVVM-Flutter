import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mvvm_flutter_app/presentation/resources/assets_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/colors_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(seconds: 2),
      () => _goNext(),
    );
  }

  _goNext() {
    Navigator.pushReplacementNamed(
      context,
      Routes.onBoardingRoute,
    );
  }

  @override
  void initState() {
    _startDelay();
    //   FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
