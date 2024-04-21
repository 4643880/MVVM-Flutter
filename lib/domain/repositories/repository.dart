import 'package:fpdart/fpdart.dart';
import 'package:mvvm_flutter_app/data/network_services/failure.dart';
import 'package:mvvm_flutter_app/data/request_models/login_request_model.dart';
import 'package:mvvm_flutter_app/data/response_models/user_data_model.dart';
import 'package:mvvm_flutter_app/domain/models/user_model.dart';

abstract class Repository {
  // will send one of these two <Failure, UserDataModel>
  Future<Either<Failure, User>> login(LoginRequest loginRequest);
}



/* 
// Either example
Either<String, double> divide(double dividend, double divisor) {
  if (divisor == 0) {
    return Left('Division by zero error');
  } else {
    return Right(dividend / divisor);
  }
}

*/