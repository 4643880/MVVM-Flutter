import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mvvm_flutter_app/data/network_services/failure.dart';
import 'package:mvvm_flutter_app/presentation/resources/strings_manager.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  BAD_CERTIFICATE,
  DEFAULT
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BAD_CERTIFICATE.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(
          statusCode: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST.tr,
        );
      case DataSource.BAD_CERTIFICATE:
        return Failure(
          statusCode: ResponseCode.BAD_CERTIFICATE,
          message: ResponseMessage.BAD_CERTIFICATE_MESSAGE.tr,
        );
      case DataSource.FORBIDDEN:
        return Failure(
          statusCode: ResponseCode.FORBIDDEN,
          message: ResponseMessage.FORBIDDEN.tr,
        );
      case DataSource.UNAUTHORISED:
        return Failure(
          statusCode: ResponseCode.UNAUTHORISED,
          message: ResponseMessage.UNAUTHORISED.tr,
        );
      case DataSource.NOT_FOUND:
        return Failure(
          statusCode: ResponseCode.NOT_FOUND,
          message: ResponseMessage.NOT_FOUND.tr,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          statusCode: ResponseCode.INTERNAL_SERVER_ERROR,
          message: ResponseMessage.INTERNAL_SERVER_ERROR.tr,
        );
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          statusCode: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseMessage.CONNECT_TIMEOUT.tr,
        );
      case DataSource.CANCEL:
        return Failure(
          statusCode: ResponseCode.CANCEL,
          message: ResponseMessage.CANCEL.tr,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          statusCode: ResponseCode.RECEIVE_TIMEOUT,
          message: ResponseMessage.RECEIVE_TIMEOUT.tr,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          statusCode: ResponseCode.SEND_TIMEOUT,
          message: ResponseMessage.SEND_TIMEOUT.tr,
        );
      case DataSource.CACHE_ERROR:
        return Failure(
          statusCode: ResponseCode.CACHE_ERROR,
          message: ResponseMessage.CACHE_ERROR.tr,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          statusCode: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION.tr,
        );
      case DataSource.DEFAULT:
        return Failure(
            statusCode: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
      default:
        return Failure(
            statusCode: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int BAD_CERTIFICATE =
      495; // Custom status code for bad certificate
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.noContent; // success with no content
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, api rejected our request
  static const String FORBIDDEN =
      AppStrings.forbiddenError; // failure,  api rejected our request
  static const String UNAUTHORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String NOT_FOUND = AppStrings
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String DEFAULT =
      AppStrings.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT =
      AppStrings.timeoutError; // issue in connectivity
  static const String CANCEL =
      AppStrings.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = AppStrings
      .defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION =
      AppStrings.noInternetError; // issue in connectivity

  static const String BAD_CERTIFICATE_MESSAGE = AppStrings.badCertificate;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
