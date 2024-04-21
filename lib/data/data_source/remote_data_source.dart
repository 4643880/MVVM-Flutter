// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mvvm_flutter_app/data/network_services/app_api.dart';
import 'package:mvvm_flutter_app/data/request_models/login_request_model.dart';
import 'package:mvvm_flutter_app/data/response_models/user_data_model.dart';

// ==================================================
// Remote Data Source Methods
// ==================================================
abstract class RemoteDataSource {
  Future<UserDataModel> login(LoginRequest loginRequest);
}

// ==================================================
// Remote Data Source Implementer
// ==================================================
class RemoteDataSourceImplementer implements RemoteDataSource {
  AppNetworkServiceClient _appNetworkServiceClient;

  RemoteDataSourceImplementer(
    this._appNetworkServiceClient,
  );

  @override
  Future<UserDataModel> login(LoginRequest loginRequest) async {
    return await _appNetworkServiceClient.login(
      username: loginRequest.username!,
      password: loginRequest.password!,
      imei: loginRequest.imei!,
      deviceType: loginRequest.deviceType!,
    );
  }
}
