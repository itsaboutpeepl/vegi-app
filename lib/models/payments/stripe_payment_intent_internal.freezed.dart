// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_payment_intent_internal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripePaymentIntentInternal _$StripePaymentIntentInternalFromJson(
    Map<String, dynamic> json) {
  return _StripePaymentIntentInternal.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentIntentInternal {
  @JsonKey(name: 'client_secret')
  String get clientSecret => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentIntentInternalCopyWith<StripePaymentIntentInternal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentIntentInternalCopyWith<$Res> {
  factory $StripePaymentIntentInternalCopyWith(
          StripePaymentIntentInternal value,
          $Res Function(StripePaymentIntentInternal) then) =
      _$StripePaymentIntentInternalCopyWithImpl<$Res,
          StripePaymentIntentInternal>;
  @useResult
  $Res call({@JsonKey(name: 'client_secret') String clientSecret, String id});
}

/// @nodoc
class _$StripePaymentIntentInternalCopyWithImpl<$Res,
        $Val extends StripePaymentIntentInternal>
    implements $StripePaymentIntentInternalCopyWith<$Res> {
  _$StripePaymentIntentInternalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StripePaymentIntentInternalCopyWith<$Res>
    implements $StripePaymentIntentInternalCopyWith<$Res> {
  factory _$$_StripePaymentIntentInternalCopyWith(
          _$_StripePaymentIntentInternal value,
          $Res Function(_$_StripePaymentIntentInternal) then) =
      __$$_StripePaymentIntentInternalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'client_secret') String clientSecret, String id});
}

/// @nodoc
class __$$_StripePaymentIntentInternalCopyWithImpl<$Res>
    extends _$StripePaymentIntentInternalCopyWithImpl<$Res,
        _$_StripePaymentIntentInternal>
    implements _$$_StripePaymentIntentInternalCopyWith<$Res> {
  __$$_StripePaymentIntentInternalCopyWithImpl(
      _$_StripePaymentIntentInternal _value,
      $Res Function(_$_StripePaymentIntentInternal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
    Object? id = null,
  }) {
    return _then(_$_StripePaymentIntentInternal(
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripePaymentIntentInternal extends _StripePaymentIntentInternal {
  _$_StripePaymentIntentInternal(
      {@JsonKey(name: 'client_secret') required this.clientSecret,
      required this.id})
      : super._();

  factory _$_StripePaymentIntentInternal.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentIntentInternalFromJson(json);

  @override
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @override
  final String id;

  @override
  String toString() {
    return 'StripePaymentIntentInternal(clientSecret: $clientSecret, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentIntentInternal &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clientSecret, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripePaymentIntentInternalCopyWith<_$_StripePaymentIntentInternal>
      get copyWith => __$$_StripePaymentIntentInternalCopyWithImpl<
          _$_StripePaymentIntentInternal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripePaymentIntentInternalToJson(
      this,
    );
  }
}

abstract class _StripePaymentIntentInternal
    extends StripePaymentIntentInternal {
  factory _StripePaymentIntentInternal(
      {@JsonKey(name: 'client_secret') required final String clientSecret,
      required final String id}) = _$_StripePaymentIntentInternal;
  _StripePaymentIntentInternal._() : super._();

  factory _StripePaymentIntentInternal.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentIntentInternal.fromJson;

  @override
  @JsonKey(name: 'client_secret')
  String get clientSecret;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentIntentInternalCopyWith<_$_StripePaymentIntentInternal>
      get copyWith => throw _privateConstructorUsedError;
}
