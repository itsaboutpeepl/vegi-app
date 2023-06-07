// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_payment_method_internal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripePaymentMethodInternal _$StripePaymentMethodInternalFromJson(
    Map<String, dynamic> json) {
  return _StripePaymentMethodInternal.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentMethodInternal {
  String get id => throw _privateConstructorUsedError;
  StripePaymentMethodType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_details')
  StripeBillingDetails? get billingDetails =>
      throw _privateConstructorUsedError;
  StripePaymentMethodCard? get card =>
      throw _privateConstructorUsedError; // Only if this is a card paymentMethod
  String? get customer => throw _privateConstructorUsedError;
  num get created => throw _privateConstructorUsedError;
  bool get livemode => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentMethodInternalCopyWith<StripePaymentMethodInternal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentMethodInternalCopyWith<$Res> {
  factory $StripePaymentMethodInternalCopyWith(
          StripePaymentMethodInternal value,
          $Res Function(StripePaymentMethodInternal) then) =
      _$StripePaymentMethodInternalCopyWithImpl<$Res,
          StripePaymentMethodInternal>;
  @useResult
  $Res call(
      {String id,
      StripePaymentMethodType type,
      @JsonKey(name: 'billing_details') StripeBillingDetails? billingDetails,
      StripePaymentMethodCard? card,
      String? customer,
      num created,
      bool livemode,
      Map<String, dynamic> metadata});

  $StripeBillingDetailsCopyWith<$Res>? get billingDetails;
  $StripePaymentMethodCardCopyWith<$Res>? get card;
}

/// @nodoc
class _$StripePaymentMethodInternalCopyWithImpl<$Res,
        $Val extends StripePaymentMethodInternal>
    implements $StripePaymentMethodInternalCopyWith<$Res> {
  _$StripePaymentMethodInternalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? billingDetails = freezed,
    Object? card = freezed,
    Object? customer = freezed,
    Object? created = null,
    Object? livemode = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodType,
      billingDetails: freezed == billingDetails
          ? _value.billingDetails
          : billingDetails // ignore: cast_nullable_to_non_nullable
              as StripeBillingDetails?,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCard?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as num,
      livemode: null == livemode
          ? _value.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StripeBillingDetailsCopyWith<$Res>? get billingDetails {
    if (_value.billingDetails == null) {
      return null;
    }

    return $StripeBillingDetailsCopyWith<$Res>(_value.billingDetails!, (value) {
      return _then(_value.copyWith(billingDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StripePaymentMethodCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $StripePaymentMethodCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StripePaymentMethodInternalCopyWith<$Res>
    implements $StripePaymentMethodInternalCopyWith<$Res> {
  factory _$$_StripePaymentMethodInternalCopyWith(
          _$_StripePaymentMethodInternal value,
          $Res Function(_$_StripePaymentMethodInternal) then) =
      __$$_StripePaymentMethodInternalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      StripePaymentMethodType type,
      @JsonKey(name: 'billing_details') StripeBillingDetails? billingDetails,
      StripePaymentMethodCard? card,
      String? customer,
      num created,
      bool livemode,
      Map<String, dynamic> metadata});

  @override
  $StripeBillingDetailsCopyWith<$Res>? get billingDetails;
  @override
  $StripePaymentMethodCardCopyWith<$Res>? get card;
}

/// @nodoc
class __$$_StripePaymentMethodInternalCopyWithImpl<$Res>
    extends _$StripePaymentMethodInternalCopyWithImpl<$Res,
        _$_StripePaymentMethodInternal>
    implements _$$_StripePaymentMethodInternalCopyWith<$Res> {
  __$$_StripePaymentMethodInternalCopyWithImpl(
      _$_StripePaymentMethodInternal _value,
      $Res Function(_$_StripePaymentMethodInternal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? billingDetails = freezed,
    Object? card = freezed,
    Object? customer = freezed,
    Object? created = null,
    Object? livemode = null,
    Object? metadata = null,
  }) {
    return _then(_$_StripePaymentMethodInternal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodType,
      billingDetails: freezed == billingDetails
          ? _value.billingDetails
          : billingDetails // ignore: cast_nullable_to_non_nullable
              as StripeBillingDetails?,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCard?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as num,
      livemode: null == livemode
          ? _value.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripePaymentMethodInternal extends _StripePaymentMethodInternal {
  _$_StripePaymentMethodInternal(
      {required this.id,
      required this.type,
      @JsonKey(name: 'billing_details') this.billingDetails,
      this.card,
      this.customer,
      this.created = 0,
      required this.livemode,
      this.metadata = const {}})
      : super._();

  factory _$_StripePaymentMethodInternal.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentMethodInternalFromJson(json);

  @override
  final String id;
  @override
  final StripePaymentMethodType type;
  @override
  @JsonKey(name: 'billing_details')
  final StripeBillingDetails? billingDetails;
  @override
  final StripePaymentMethodCard? card;
// Only if this is a card paymentMethod
  @override
  final String? customer;
  @override
  @JsonKey()
  final num created;
  @override
  final bool livemode;
  @override
  @JsonKey()
  final Map<String, dynamic> metadata;

  @override
  String toString() {
    return 'StripePaymentMethodInternal(id: $id, type: $type, billingDetails: $billingDetails, card: $card, customer: $customer, created: $created, livemode: $livemode, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentMethodInternal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.billingDetails, billingDetails) ||
                other.billingDetails == billingDetails) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.livemode, livemode) ||
                other.livemode == livemode) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      billingDetails,
      card,
      customer,
      created,
      livemode,
      const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripePaymentMethodInternalCopyWith<_$_StripePaymentMethodInternal>
      get copyWith => __$$_StripePaymentMethodInternalCopyWithImpl<
          _$_StripePaymentMethodInternal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripePaymentMethodInternalToJson(
      this,
    );
  }
}

abstract class _StripePaymentMethodInternal
    extends StripePaymentMethodInternal {
  factory _StripePaymentMethodInternal(
      {required final String id,
      required final StripePaymentMethodType type,
      @JsonKey(name: 'billing_details')
          final StripeBillingDetails? billingDetails,
      final StripePaymentMethodCard? card,
      final String? customer,
      final num created,
      required final bool livemode,
      final Map<String, dynamic> metadata}) = _$_StripePaymentMethodInternal;
  _StripePaymentMethodInternal._() : super._();

  factory _StripePaymentMethodInternal.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentMethodInternal.fromJson;

  @override
  String get id;
  @override
  StripePaymentMethodType get type;
  @override
  @JsonKey(name: 'billing_details')
  StripeBillingDetails? get billingDetails;
  @override
  StripePaymentMethodCard? get card;
  @override // Only if this is a card paymentMethod
  String? get customer;
  @override
  num get created;
  @override
  bool get livemode;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentMethodInternalCopyWith<_$_StripePaymentMethodInternal>
      get copyWith => throw _privateConstructorUsedError;
}
