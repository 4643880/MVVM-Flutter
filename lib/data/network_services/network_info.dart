import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/presentation/resources/strings_manager.dart';
import 'dart:developer' as devtools show log;


abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementor implements NetworkInfo{
  NetworkInfoImplementor()


  @override
  Future<bool> get isConnected => internetAvailabilityCheck(false);

}


  Future<bool> internetAvailabilityCheck(bool fromInternetCheckScreen) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      devtools.log("INTERNET NOT AVAILABLE");
      // Util.showErrorSnackBar(AppStrings.internetNotAvailable);
      if (fromInternetCheckScreen == false) {
        // Get.offAllNamed(routeInternetNotAvailable);
      }
      return false;
    }
  }