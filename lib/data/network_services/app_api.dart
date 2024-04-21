import 'package:dio/dio.dart';
import 'package:mvvm_flutter_app/app/constants.dart';
import 'package:mvvm_flutter_app/data/response_models/user_data_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.kBaseUrl)
abstract class AppNetworkServiceClient {
  // Retrofit Generator will generate .g file using build runner script
  factory AppNetworkServiceClient(Dio dio, {required String baseUrl}) =
      _AppNetworkServiceClient;

  @POST("/customer/login")
  Future<UserDataModel> login({
    @Field("username") required String username,
    @Field("password") required String password,
    @Field("imei") required String imei,
    @Field("deviceType") required String deviceType,
  });
}
