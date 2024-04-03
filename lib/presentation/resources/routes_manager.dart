import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/presentation/resources/strings_manager.dart';
import 'package:mvvm_flutter_app/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:mvvm_flutter_app/presentation/screens/home/home_screen.dart';
import 'package:mvvm_flutter_app/presentation/screens/login/login_screen.dart';
import 'package:mvvm_flutter_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:mvvm_flutter_app/presentation/screens/register/register_screen.dart';
import 'package:mvvm_flutter_app/presentation/screens/splash/splash_screen.dart';
import 'package:mvvm_flutter_app/presentation/screens/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
