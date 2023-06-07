// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_payment_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripePaymentIntent _$StripePaymentIntentFromJson(Map<String, dynamic> json) {
  return _StripePaymentIntent.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentIntent {
  StripeCustomer? get customer => throw _privateConstructorUsedError;
  String get ephemeralKey => throw _privateConstructorUsedError;
  String get publishableKey => throw _privateConstructorUsedError;
  StripePaymentIntentInternal get paymentIntent =>
      throw _privateConstructorUsedError;
  List<StripePaymentMethodInternal> get paymentMethods =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentIntentCopyWith<StripePaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentIntentCopyWith<$Res> {
  factory $StripePaymentIntentCopyWith(
          StripePaymentIntent value, $Res Function(StripePaymentIntent) then) =
      _$StripePaymentIntentCopyWithImpl<$Res, StripePaymentIntent>;
  @useResult
  $Res call(
      {StripeCustomer? customer,
      String ephemeralKey,
      String publishableKey,
      StripePaymentIntentInternal paymentIntent,
      List<StripePaymentMethodInternal> paymentMethods});

  $StripeCustomerCopyWith<$Res>? get customer;
  $StripePaymentIntentInternalCopyWith<$Res> get paymentIntent;
}

/// @nodoc
class _$StripePaymentIntentCopyWithImpl<$Res, $Val extends StripePaymentIntent>
    implements $StripePaymentIntentCopyWith<$Res> {
  _$StripePaymentIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
    Object? ephemeralKey = null,
    Object? publishableKey = null,
    Object? paymentIntent = null,
    Object? paymentMethods = null,
  }) {
    return _then(_value.copyWith(
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as StripeCustomer?,
      ephemeralKey: null == ephemeralKey
          ? _value.ephemeralKey
          : ephemeralKey // ignore: cast_nullable_to_non_nullable
              as String,
      publishableKey: null == publishableKey
          ? _value.publishableKey
          : publishableKey // ignore: cast_nullable_to_non_nullable
              as String,
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
  $StripeCustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $StripeCustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
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
abstract class _$$_StripePaymentIntentCopyWith<$Res>
    implements $StripePaymentIntentCopyWith<$Res> {
  factory _$$_StripePaymentIntentCopyWith(_$_StripePaymentIntent value,
          $Res Function(_$_StripePaymentIntent) then) =
      __$$_StripePaymentIntentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StripeCustomer? customer,
      String ephemeralKey,
      String publishableKey,
      StripePaymentIntentInternal paymentIntent,
      List<StripePaymentMethodInternal> paymentMethods});

  @override
  $StripeCustomerCopyWith<$Res>? get customer;
  @override
  $StripePaymentIntentInternalCopyWith<$Res> get paymentIntent;
}

/// @nodoc
class __$$_StripePaymentIntentCopyWithImpl<$Res>
    extends _$StripePaymentIntentCopyWithImpl<$Res, _$_StripePaymentIntent>
    implements _$$_StripePaymentIntentCopyWith<$Res> {
  __$$_StripePaymentIntentCopyWithImpl(_$_StripePaymentIntent _value,
      $Res Function(_$_StripePaymentIntent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
    Object? ephemeralKey = null,
    Object? publishableKey = null,
    Object? paymentIntent = null,
    Object? paymentMethods = null,
  }) {
    return _then(_$_StripePaymentIntent(
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as StripeCustomer?,
      ephemeralKey: null == ephemeralKey
          ? _value.ephemeralKey
          : ephemeralKey // ignore: cast_nullable_to_non_nullable
              as String,
      publishableKey: null == publishableKey
          ? _value.publishableKey
          : publishableKey // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_StripePaymentIntent extends _StripePaymentIntent {
  _$_StripePaymentIntent(
      {this.customer,
      required this.ephemeralKey,
      required this.publishableKey,
      required this.paymentIntent,
      this.paymentMethods = const []})
      : super._();

  factory _$_StripePaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentIntentFromJson(json);

  @override
  final StripeCustomer? customer;
  @override
  final String ephemeralKey;
  @override
  final String publishableKey;
  @override
  final StripePaymentIntentInternal paymentIntent;
  @override
  @JsonKey()
  final List<StripePaymentMethodInternal> paymentMethods;

  @override
  String toString() {
    return 'StripePaymentIntent(customer: $customer, ephemeralKey: $ephemeralKey, publishableKey: $publishableKey, paymentIntent: $paymentIntent, paymentMethods: $paymentMethods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentIntent &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.ephemeralKey, ephemeralKey) ||
                other.ephemeralKey == ephemeralKey) &&
            (identical(other.publishableKey, publishableKey) ||
                other.publishableKey == publishableKey) &&
            (identical(other.paymentIntent, paymentIntent) ||
                other.paymentIntent == paymentIntent) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethods, paymentMethods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      ephemeralKey,
      publishableKey,
      paymentIntent,
      const DeepCollectionEquality().hash(paymentMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripePaymentIntentCopyWith<_$_StripePaymentIntent> get copyWith =>
      __$$_StripePaymentIntentCopyWithImpl<_$_StripePaymentIntent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripePaymentIntentToJson(
      this,
    );
  }
}

abstract class _StripePaymentIntent extends StripePaymentIntent {
  factory _StripePaymentIntent(
          {final StripeCustomer? customer,
          required final String ephemeralKey,
          required final String publishableKey,
          required final StripePaymentIntentInternal paymentIntent,
          final List<StripePaymentMethodInternal> paymentMethods}) =
      _$_StripePaymentIntent;
  _StripePaymentIntent._() : super._();

  factory _StripePaymentIntent.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentIntent.fromJson;

  @override
  StripeCustomer? get customer;
  @override
  String get ephemeralKey;
  @override
  String get publishableKey;
  @override
  StripePaymentIntentInternal get paymentIntent;
  @override
  List<StripePaymentMethodInternal> get paymentMethods;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentIntentCopyWith<_$_StripePaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}
