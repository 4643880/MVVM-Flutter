// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyLoginFreezedModel {
  String? get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyLoginFreezedModelCopyWith<MyLoginFreezedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyLoginFreezedModelCopyWith<$Res> {
  factory $MyLoginFreezedModelCopyWith(
          MyLoginFreezedModel value, $Res Function(MyLoginFreezedModel) then) =
      _$MyLoginFreezedModelCopyWithImpl<$Res, MyLoginFreezedModel>;
  @useResult
  $Res call({String? username, String? password});
}

/// @nodoc
class _$MyLoginFreezedModelCopyWithImpl<$Res, $Val extends MyLoginFreezedModel>
    implements $MyLoginFreezedModelCopyWith<$Res> {
  _$MyLoginFreezedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyLoginFreezedModelImplCopyWith<$Res>
    implements $MyLoginFreezedModelCopyWith<$Res> {
  factory _$$MyLoginFreezedModelImplCopyWith(_$MyLoginFreezedModelImpl value,
          $Res Function(_$MyLoginFreezedModelImpl) then) =
      __$$MyLoginFreezedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? username, String? password});
}

/// @nodoc
class __$$MyLoginFreezedModelImplCopyWithImpl<$Res>
    extends _$MyLoginFreezedModelCopyWithImpl<$Res, _$MyLoginFreezedModelImpl>
    implements _$$MyLoginFreezedModelImplCopyWith<$Res> {
  __$$MyLoginFreezedModelImplCopyWithImpl(_$MyLoginFreezedModelImpl _value,
      $Res Function(_$MyLoginFreezedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$MyLoginFreezedModelImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyLoginFreezedModelImpl implements _MyLoginFreezedModel {
  _$MyLoginFreezedModelImpl({this.username, this.password});

  @override
  final String? username;
  @override
  final String? password;

  @override
  String toString() {
    return 'MyLoginFreezedModel(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyLoginFreezedModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyLoginFreezedModelImplCopyWith<_$MyLoginFreezedModelImpl> get copyWith =>
      __$$MyLoginFreezedModelImplCopyWithImpl<_$MyLoginFreezedModelImpl>(
          this, _$identity);
}

abstract class _MyLoginFreezedModel implements MyLoginFreezedModel {
  factory _MyLoginFreezedModel(
      {final String? username,
      final String? password}) = _$MyLoginFreezedModelImpl;

  @override
  String? get username;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$MyLoginFreezedModelImplCopyWith<_$MyLoginFreezedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
