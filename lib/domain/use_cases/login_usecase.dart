import 'package:fpdart/src/either.dart';
import 'package:mvvm_flutter_app/app/functions.dart';
import 'package:mvvm_flutter_app/data/network_services/failure.dart';
import 'package:mvvm_flutter_app/data/request_models/login_request_model.dart';
import 'package:mvvm_flutter_app/domain/models/device_info_model.dart';
import 'package:mvvm_flutter_app/domain/models/user_model.dart';
import 'package:mvvm_flutter_app/domain/repositories/repository.dart';
import 'package:mvvm_flutter_app/domain/use_cases/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, User> {
  Repository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> execute(input) async {
    DeviceInfo deviceDetails = await getDeviceDetails();
    return repository.login(
      loginRequest: LoginRequest(
        username: input.email,
        password: input.password,
        deviceType: deviceDetails.name,
        imei: deviceDetails.identifier,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput({required this.email, required this.password});
}
