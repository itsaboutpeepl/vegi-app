// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'green_bean_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GreenBeanToken _$GreenBeanTokenFromJson(Map<String, dynamic> json) {
  return _GreenBeanToken.fromJson(json);
}

/// @nodoc
mixin _$GreenBeanToken {
  num get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GreenBeanTokenCopyWith<GreenBeanToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GreenBeanTokenCopyWith<$Res> {
  factory $GreenBeanTokenCopyWith(
          GreenBeanToken value, $Res Function(GreenBeanToken) then) =
      _$GreenBeanTokenCopyWithImpl<$Res, GreenBeanToken>;
  @useResult
  $Res call({num amount});
}

/// @nodoc
class _$GreenBeanTokenCopyWithImpl<$Res, $Val extends GreenBeanToken>
    implements $GreenBeanTokenCopyWith<$Res> {
  _$GreenBeanTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GreenBeanTokenCopyWith<$Res>
    implements $GreenBeanTokenCopyWith<$Res> {
  factory _$$_GreenBeanTokenCopyWith(
          _$_GreenBeanToken value, $Res Function(_$_GreenBeanToken) then) =
      __$$_GreenBeanTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num amount});
}

/// @nodoc
class __$$_GreenBeanTokenCopyWithImpl<$Res>
    extends _$GreenBeanTokenCopyWithImpl<$Res, _$_GreenBeanToken>
    implements _$$_GreenBeanTokenCopyWith<$Res> {
  __$$_GreenBeanTokenCopyWithImpl(
      _$_GreenBeanToken _value, $Res Function(_$_GreenBeanToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$_GreenBeanToken(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_GreenBeanToken extends _GreenBeanToken {
  _$_GreenBeanToken({required this.amount}) : super._();

  factory _$_GreenBeanToken.fromJson(Map<String, dynamic> json) =>
      _$$_GreenBeanTokenFromJson(json);

  @override
  final num amount;

  @override
  String toString() {
    return 'GreenBeanToken(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GreenBeanToken &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GreenBeanTokenCopyWith<_$_GreenBeanToken> get copyWith =>
      __$$_GreenBeanTokenCopyWithImpl<_$_GreenBeanToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GreenBeanTokenToJson(
      this,
    );
  }
}

abstract class _GreenBeanToken extends GreenBeanToken {
  factory _GreenBeanToken({required final num amount}) = _$_GreenBeanToken;
  _GreenBeanToken._() : super._();

  factory _GreenBeanToken.fromJson(Map<String, dynamic> json) =
      _$_GreenBeanToken.fromJson;

  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$_GreenBeanTokenCopyWith<_$_GreenBeanToken> get copyWith =>
      throw _privateConstructorUsedError;
}
