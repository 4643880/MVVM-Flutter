import 'dart:async';
import 'package:fpdart/src/either.dart';
import 'package:mvvm_flutter_app/data/network_services/failure.dart';
import 'package:mvvm_flutter_app/domain/models/user_model.dart';
import 'package:mvvm_flutter_app/domain/use_cases/login_usecase.dart';
import 'package:mvvm_flutter_app/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_app/presentation/data_classes/freezed_data_classes.dart';
import 'dart:developer' as devtools show log;

class LoginViewModel
    implements BaseViewModel, LoginViewModelInputs, LoginViewModelOutputs {
  LoginViewModel({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase;
  late final StreamController _userameStreamController;
  late final StreamController _passwordStreamController;
  final LoginUseCase _loginUseCase;

  // person1 == person2 just like equatable result will be false because hasCode is diffrent for both
  // using freezed
  MyLoginFreezedModel loginObject = MyLoginFreezedModel();

  @override
  void start() {
    _userameStreamController = StreamController<String>.broadcast();
    _passwordStreamController = StreamController<String>.broadcast();
  }

  @override
  void dispose() {
    _userameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  setUserName(String username) {
    _userameStreamController.add(username);
    loginObject = loginObject.copyWith(username: username);
  }

  @override
  setPassword(String password) {
    _passwordStreamController.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        email: loginObject.username!,
        password: loginObject.password!,
      ),
    ))
        .fold((Failure l) {
      // left -> failure
      devtools.log(
        "=> LoginViewMode: StatusCode: ${l.statusCode} Message: ${l.message}",
      );
    }, (User r) {
      // right -> success (data)
      devtools.log(r.toString());
      print(r.toString());
    });
  }

  @override
  Sink get InputUserName => _userameStreamController.sink;

  @override
  Sink get InputUserPassword => _passwordStreamController.sink;

  @override
  Stream<bool> get outputIsUsernameValid => _userameStreamController.stream.map(
        (username) => _isUserNameValid(username),
      );

  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map(
        (password) => _isPasswordValid(password),
      );

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
  setUserName(String username);
  setPassword(String password);
  login();

  Sink get InputUserName;
  Sink get InputUserPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;
  Stream<bool> get outputIsPasswordValid;
}
