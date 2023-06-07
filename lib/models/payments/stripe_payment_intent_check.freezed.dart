// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_payment_intent_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripePaymentIntentCheck _$StripePaymentIntentCheckFromJson(
    Map<String, dynamic> json) {
  return _StripePaymentIntentCheck.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentIntentCheck {
  StripePaymentIntentInternal get paymentIntent =>
      throw _privateConstructorUsedError;
  List<StripePaymentMethodInternal> get paymentMethods =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentIntentCheckCopyWith<StripePaymentIntentCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentIntentCheckCopyWith<$Res> {
  factory $StripePaymentIntentCheckCopyWith(StripePaymentIntentCheck value,
          $Res Function(StripePaymentIntentCheck) then) =
      _$StripePaymentIntentCheckCopyWithImpl<$Res, StripePaymentIntentCheck>;
  @useResult
  $Res call(
      {StripePaymentIntentInternal paymentIntent,
      List<StripePaymentMethodInternal> paymentMethods});

  $StripePaymentIntentInternalCopyWith<$Res> get paymentIntent;
}

/// @nodoc
class _$StripePaymentIntentCheckCopyWithImpl<$Res,
        $Val extends StripePaymentIntentCheck>
    implements $StripePaymentIntentCheckCopyWith<$Res> {
  _$StripePaymentIntentCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentIntent = null,
    Object? paymentMethods = null,
  }) {
    return _then(_value.copyWith(
      paymentIntent: null == paymentIntent
          ? _value.paymentIntent
          : paymentIntent // ignore: cast_nullable_to_non_nullable
              as StripePaymentIntentInternal,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<StripePaymentMethodInternal>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StripePaymentIntentInternalCopyWith<$Res> get paymentIntent {
    return $StripePaymentIntentInternalCopyWith<$Res>(_value.paymentIntent,
        (value) {
      return _then(_value.copyWith(paymentIntent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StripePaymentIntentCheckCopyWith<$Res>
    implements $StripePaymentIntentCheckCopyWith<$Res> {
  factory _$$_StripePaymentIntentCheckCopyWith(
          _$_StripePaymentIntentCheck value,
          $Res Function(_$_StripePaymentIntentCheck) then) =
      __$$_StripePaymentIntentCheckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StripePaymentIntentInternal paymentIntent,
      List<StripePaymentMethodInternal> paymentMethods});

  @override
  $StripePaymentIntentInternalCopyWith<$Res> get paymentIntent;
}

/// @nodoc
class __$$_StripePaymentIntentCheckCopyWithImpl<$Res>
    extends _$StripePaymentIntentCheckCopyWithImpl<$Res,
        _$_StripePaymentIntentCheck>
    implements _$$_StripePaymentIntentCheckCopyWith<$Res> {
  __$$_StripePaymentIntentCheckCopyWithImpl(_$_StripePaymentIntentCheck _value,
      $Res Function(_$_StripePaymentIntentCheck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentIntent = null,
    Object? paymentMethods = null,
  }) {
    return _then(_$_StripePaymentIntentCheck(
      paymentIntent: null == paymentIntent
          ? _value.paymentIntent
          : paymentIntent // ignore: cast_nullable_to_non_nullable
              as StripePaymentIntentInternal,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<StripePaymentMethodInternal>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripePaymentIntentCheck extends _StripePaymentIntentCheck {
  _$_StripePaymentIntentCheck(
      {required this.paymentIntent, this.paymentMethods = const []})
      : super._();

  factory _$_StripePaymentIntentCheck.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentIntentCheckFromJson(json);

  @override
  final StripePaymentIntentInternal paymentIntent;
  @override
  @JsonKey()
  final List<StripePaymentMethodInternal> paymentMethods;

  @override
  String toString() {
    return 'StripePaymentIntentCheck(paymentIntent: $paymentIntent, paymentMethods: $paymentMethods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentIntentCheck &&
            (identical(other.paymentIntent, paymentIntent) ||
                other.paymentIntent == paymentIntent) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethods, paymentMethods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentIntent,
      const DeepCollectionEquality().hash(paymentMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripePaymentIntentCheckCopyWith<_$_StripePaymentIntentCheck>
      get copyWith => __$$_StripePaymentIntentCheckCopyWithImpl<
          _$_StripePaymentIntentCheck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripePaymentIntentCheckToJson(
      this,
    );
  }
}

abstract class _StripePaymentIntentCheck extends StripePaymentIntentCheck {
  factory _StripePaymentIntentCheck(
          {required final StripePaymentIntentInternal paymentIntent,
          final List<StripePaymentMethodInternal> paymentMethods}) =
      _$_StripePaymentIntentCheck;
  _StripePaymentIntentCheck._() : super._();

  factory _StripePaymentIntentCheck.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentIntentCheck.fromJson;

  @override
  StripePaymentIntentInternal get paymentIntent;
  @override
  List<StripePaymentMethodInternal> get paymentMethods;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentIntentCheckCopyWith<_$_StripePaymentIntentCheck>
      get copyWith => throw _privateConstructorUsedError;
}
