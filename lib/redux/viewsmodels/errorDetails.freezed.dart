// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'errorDetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) {
  return _ErrorDetails.fromJson(json);
}

/// @nodoc
mixin _$ErrorDetails {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res, ErrorDetails>;
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class _$ErrorDetailsCopyWithImpl<$Res, $Val extends ErrorDetails>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorDetailsCopyWith<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  factory _$$_ErrorDetailsCopyWith(
          _$_ErrorDetails value, $Res Function(_$_ErrorDetails) then) =
      __$$_ErrorDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class __$$_ErrorDetailsCopyWithImpl<$Res>
    extends _$ErrorDetailsCopyWithImpl<$Res, _$_ErrorDetails>
    implements _$$_ErrorDetailsCopyWith<$Res> {
  __$$_ErrorDetailsCopyWithImpl(
      _$_ErrorDetails _value, $Res Function(_$_ErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$_ErrorDetails(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_ErrorDetails extends _ErrorDetails {
  _$_ErrorDetails({required this.title, required this.message}) : super._();

  factory _$_ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorDetailsFromJson(json);

  @override
  final String title;
  @override
  final String message;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorDetailsCopyWith<_$_ErrorDetails> get copyWith =>
      __$$_ErrorDetailsCopyWithImpl<_$_ErrorDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorDetailsToJson(
      this,
    );
  }
}

abstract class _ErrorDetails extends ErrorDetails {
  factory _ErrorDetails(
      {required final String title,
      required final String message}) = _$_ErrorDetails;
  _ErrorDetails._() : super._();

  factory _ErrorDetails.fromJson(Map<String, dynamic> json) =
      _$_ErrorDetails.fromJson;

  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorDetailsCopyWith<_$_ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
