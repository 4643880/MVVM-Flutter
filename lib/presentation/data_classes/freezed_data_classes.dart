import 'package:freezed_annotation/freezed_annotation.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
part 'freezed_data_classes.freezed.dart';

@freezed
class MyLoginFreezedModel with _$MyLoginFreezedModel {
  // _MyLoginFreezedModel will be auto generated model
  factory MyLoginFreezedModel({String? username, String? password}) =
      _MyLoginFreezedModel;
}
