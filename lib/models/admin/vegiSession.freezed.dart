// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vegiSession.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VegiSession _$VegiSessionFromJson(Map<String, dynamic> json) {
  return _VegiSession.fromJson(json);
}

/// @nodoc
mixin _$VegiSession {
  String get sessionCookie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VegiSessionCopyWith<VegiSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VegiSessionCopyWith<$Res> {
  factory $VegiSessionCopyWith(
          VegiSession value, $Res Function(VegiSession) then) =
      _$VegiSessionCopyWithImpl<$Res, VegiSession>;
  @useResult
  $Res call({String sessionCookie});
}

/// @nodoc
class _$VegiSessionCopyWithImpl<$Res, $Val extends VegiSession>
    implements $VegiSessionCopyWith<$Res> {
  _$VegiSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionCookie = null,
  }) {
    return _then(_value.copyWith(
      sessionCookie: null == sessionCookie
          ? _value.sessionCookie
          : sessionCookie // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VegiSessionCopyWith<$Res>
    implements $VegiSessionCopyWith<$Res> {
  factory _$$_VegiSessionCopyWith(
          _$_VegiSession value, $Res Function(_$_VegiSession) then) =
      __$$_VegiSessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionCookie});
}

/// @nodoc
class __$$_VegiSessionCopyWithImpl<$Res>
    extends _$VegiSessionCopyWithImpl<$Res, _$_VegiSession>
    implements _$$_VegiSessionCopyWith<$Res> {
  __$$_VegiSessionCopyWithImpl(
      _$_VegiSession _value, $Res Function(_$_VegiSession) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionCookie = null,
  }) {
    return _then(_$_VegiSession(
      sessionCookie: null == sessionCookie
          ? _value.sessionCookie
          : sessionCookie // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VegiSession extends _VegiSession {
  _$_VegiSession({required this.sessionCookie}) : super._();

  factory _$_VegiSession.fromJson(Map<String, dynamic> json) =>
      _$$_VegiSessionFromJson(json);

  @override
  final String sessionCookie;

  @override
  String toString() {
    return 'VegiSession(sessionCookie: $sessionCookie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VegiSession &&
            (identical(other.sessionCookie, sessionCookie) ||
                other.sessionCookie == sessionCookie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionCookie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VegiSessionCopyWith<_$_VegiSession> get copyWith =>
      __$$_VegiSessionCopyWithImpl<_$_VegiSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VegiSessionToJson(
      this,
    );
  }
}

abstract class _VegiSession extends VegiSession {
  factory _VegiSession({required final String sessionCookie}) = _$_VegiSession;
  _VegiSession._() : super._();

  factory _VegiSession.fromJson(Map<String, dynamic> json) =
      _$_VegiSession.fromJson;

  @override
  String get sessionCookie;
  @override
  @JsonKey(ignore: true)
  _$$_VegiSessionCopyWith<_$_VegiSession> get copyWith =>
      throw _privateConstructorUsedError;
}
