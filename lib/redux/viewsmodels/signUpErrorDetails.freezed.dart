// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signUpErrorDetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpErrorDetails _$SignUpErrorDetailsFromJson(Map<String, dynamic> json) {
  return _SignUpErrorDetails.fromJson(json);
}

/// @nodoc
mixin _$SignUpErrorDetails {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SignUpErrCode? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpErrorDetailsCopyWith<SignUpErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpErrorDetailsCopyWith<$Res> {
  factory $SignUpErrorDetailsCopyWith(
          SignUpErrorDetails value, $Res Function(SignUpErrorDetails) then) =
      _$SignUpErrorDetailsCopyWithImpl<$Res, SignUpErrorDetails>;
  @useResult
  $Res call({String title, String message, SignUpErrCode? code});
}

/// @nodoc
class _$SignUpErrorDetailsCopyWithImpl<$Res, $Val extends SignUpErrorDetails>
    implements $SignUpErrorDetailsCopyWith<$Res> {
  _$SignUpErrorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as SignUpErrCode?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpErrorDetailsCopyWith<$Res>
    implements $SignUpErrorDetailsCopyWith<$Res> {
  factory _$$_SignUpErrorDetailsCopyWith(_$_SignUpErrorDetails value,
          $Res Function(_$_SignUpErrorDetails) then) =
      __$$_SignUpErrorDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message, SignUpErrCode? code});
}

/// @nodoc
class __$$_SignUpErrorDetailsCopyWithImpl<$Res>
    extends _$SignUpErrorDetailsCopyWithImpl<$Res, _$_SignUpErrorDetails>
    implements _$$_SignUpErrorDetailsCopyWith<$Res> {
  __$$_SignUpErrorDetailsCopyWithImpl(
      _$_SignUpErrorDetails _value, $Res Function(_$_SignUpErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$_SignUpErrorDetails(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as SignUpErrCode?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SignUpErrorDetails extends _SignUpErrorDetails {
  _$_SignUpErrorDetails({required this.title, required this.message, this.code})
      : super._();

  factory _$_SignUpErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpErrorDetailsFromJson(json);

  @override
  final String title;
  @override
  final String message;
  @override
  final SignUpErrCode? code;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpErrorDetailsCopyWith<_$_SignUpErrorDetails> get copyWith =>
      __$$_SignUpErrorDetailsCopyWithImpl<_$_SignUpErrorDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpErrorDetailsToJson(
      this,
    );
  }
}

abstract class _SignUpErrorDetails extends SignUpErrorDetails {
  factory _SignUpErrorDetails(
      {required final String title,
      required final String message,
      final SignUpErrCode? code}) = _$_SignUpErrorDetails;
  _SignUpErrorDetails._() : super._();

  factory _SignUpErrorDetails.fromJson(Map<String, dynamic> json) =
      _$_SignUpErrorDetails.fromJson;

  @override
  String get title;
  @override
  String get message;
  @override
  SignUpErrCode? get code;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpErrorDetailsCopyWith<_$_SignUpErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
