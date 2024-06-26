import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:mvvm_flutter_app/app/app_prefs.dart';
import 'package:mvvm_flutter_app/app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter_app/presentation/resources/language_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  AppPreferences appPreferences;

  DioFactory(this.appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await appPreferences.getAppLanguage();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constant.kBaseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      headers: headers,
    );

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      // Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy to read format.
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}




// class DioFactory {
//   AppPreferences _appPreferences;

//   DioFactory(this._appPreferences);

//   Future<Dio> getDio() async {
//     Dio dio = Dio();
//     int _timeOut = 60 * 1000; // 1 min
//     String language = await _appPreferences.getAppLanguage();
//     String token = await _appPreferences.getUserToken();
//     Map<String, String> headers = {
//       CONTENT_TYPE: APPLICATION_JSON,
//       ACCEPT: APPLICATION_JSON,
//       AUTHORIZATION: token,
//       DEFAULT_LANGUAGE: language
//     };

//     dio.options = BaseOptions(
//         baseUrl: Constant.baseUrl,
//         connectTimeout: _timeOut,
//         receiveTimeout: _timeOut,
//         headers: headers);

//     if (kReleaseMode) {
//       print("release mode no logs");
//     } else {
//       dio.interceptors.add(PrettyDioLogger(
//           requestHeader: true, requestBody: true, responseHeader: true));
//     }

//     return dio;
//   }
// }
