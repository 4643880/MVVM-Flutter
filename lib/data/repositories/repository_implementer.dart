// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/src/either.dart';

import 'package:mvvm_flutter_app/data/data_source/remote_data_source.dart';
import 'package:mvvm_flutter_app/data/mapper/mapper.dart';
import 'package:mvvm_flutter_app/data/network_services/error_handler.dart';
import 'package:mvvm_flutter_app/data/network_services/failure.dart';
import 'package:mvvm_flutter_app/data/network_services/network_info.dart';
import 'package:mvvm_flutter_app/data/request_models/login_request_model.dart';
import 'package:mvvm_flutter_app/data/response_models/user_data_model.dart';
import 'package:mvvm_flutter_app/domain/models/user_model.dart';
import 'package:mvvm_flutter_app/domain/repositories/repository.dart';

class RepositoryImplementer implements Repository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryImplementer({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login(
    LoginRequest loginRequest,
  ) async {
    // Checking internet availability
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(loginRequest);

        if (response.status == 200) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              statusCode: response.status ?? ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
