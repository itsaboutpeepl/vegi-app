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
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_secret')
  String get clientSecret => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_types')
  List<String> get paymentMethodTypes => throw _privateConstructorUsedError;
  Map<String, dynamic> get shipping => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

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
  $Res call(
      {String id,
      @JsonKey(name: 'client_secret') String clientSecret,
      num amount,
      String currency,
      Map<String, dynamic> metadata,
      @JsonKey(name: 'payment_method_types') List<String> paymentMethodTypes,
      Map<String, dynamic> shipping,
      String status});
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
    Object? id = null,
    Object? clientSecret = null,
    Object? amount = null,
    Object? currency = null,
    Object? metadata = null,
    Object? paymentMethodTypes = null,
    Object? shipping = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      paymentMethodTypes: null == paymentMethodTypes
          ? _value.paymentMethodTypes
          : paymentMethodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String id,
      @JsonKey(name: 'client_secret') String clientSecret,
      num amount,
      String currency,
      Map<String, dynamic> metadata,
      @JsonKey(name: 'payment_method_types') List<String> paymentMethodTypes,
      Map<String, dynamic> shipping,
      String status});
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
    Object? id = null,
    Object? clientSecret = null,
    Object? amount = null,
    Object? currency = null,
    Object? metadata = null,
    Object? paymentMethodTypes = null,
    Object? shipping = null,
    Object? status = null,
  }) {
    return _then(_$_StripePaymentIntentInternal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      paymentMethodTypes: null == paymentMethodTypes
          ? _value.paymentMethodTypes
          : paymentMethodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripePaymentIntentInternal extends _StripePaymentIntentInternal {
  _$_StripePaymentIntentInternal(
      {required this.id,
      @JsonKey(name: 'client_secret') required this.clientSecret,
      required this.amount,
      required this.currency,
      this.metadata = const {},
      @JsonKey(name: 'payment_method_types') this.paymentMethodTypes = const [],
      this.shipping = const {},
      this.status = ''})
      : super._();

  factory _$_StripePaymentIntentInternal.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentIntentInternalFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @override
  final num amount;
  @override
  final String currency;
  @override
  @JsonKey()
  final Map<String, dynamic> metadata;
  @override
  @JsonKey(name: 'payment_method_types')
  final List<String> paymentMethodTypes;
  @override
  @JsonKey()
  final Map<String, dynamic> shipping;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'StripePaymentIntentInternal(id: $id, clientSecret: $clientSecret, amount: $amount, currency: $currency, metadata: $metadata, paymentMethodTypes: $paymentMethodTypes, shipping: $shipping, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentIntentInternal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethodTypes, paymentMethodTypes) &&
            const DeepCollectionEquality().equals(other.shipping, shipping) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clientSecret,
      amount,
      currency,
      const DeepCollectionEquality().hash(metadata),
      const DeepCollectionEquality().hash(paymentMethodTypes),
      const DeepCollectionEquality().hash(shipping),
      status);

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
      {required final String id,
      @JsonKey(name: 'client_secret')
          required final String clientSecret,
      required final num amount,
      required final String currency,
      final Map<String, dynamic> metadata,
      @JsonKey(name: 'payment_method_types')
          final List<String> paymentMethodTypes,
      final Map<String, dynamic> shipping,
      final String status}) = _$_StripePaymentIntentInternal;
  _StripePaymentIntentInternal._() : super._();

  factory _StripePaymentIntentInternal.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentIntentInternal.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'client_secret')
  String get clientSecret;
  @override
  num get amount;
  @override
  String get currency;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(name: 'payment_method_types')
  List<String> get paymentMethodTypes;
  @override
  Map<String, dynamic> get shipping;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentIntentInternalCopyWith<_$_StripePaymentIntentInternal>
      get copyWith => throw _privateConstructorUsedError;
}
