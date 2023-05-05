// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'live_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LivePayment _$LivePaymentFromJson(Map<String, dynamic> json) {
  return _LivePayment.fromJson(json);
}

/// @nodoc
mixin _$LivePayment {
  PaymentProcessingStatus get status => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  PaymentType get type => throw _privateConstructorUsedError;
  PaymentTechnology get technology => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LivePaymentCopyWith<LivePayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivePaymentCopyWith<$Res> {
  factory $LivePaymentCopyWith(
          LivePayment value, $Res Function(LivePayment) then) =
      _$LivePaymentCopyWithImpl<$Res, LivePayment>;
  @useResult
  $Res call(
      {PaymentProcessingStatus status,
      num amount,
      Currency currency,
      PaymentType type,
      PaymentTechnology technology});
}

/// @nodoc
class _$LivePaymentCopyWithImpl<$Res, $Val extends LivePayment>
    implements $LivePaymentCopyWith<$Res> {
  _$LivePaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? amount = null,
    Object? currency = null,
    Object? type = null,
    Object? technology = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentProcessingStatus,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      technology: null == technology
          ? _value.technology
          : technology // ignore: cast_nullable_to_non_nullable
              as PaymentTechnology,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LivePaymentCopyWith<$Res>
    implements $LivePaymentCopyWith<$Res> {
  factory _$$_LivePaymentCopyWith(
          _$_LivePayment value, $Res Function(_$_LivePayment) then) =
      __$$_LivePaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentProcessingStatus status,
      num amount,
      Currency currency,
      PaymentType type,
      PaymentTechnology technology});
}

/// @nodoc
class __$$_LivePaymentCopyWithImpl<$Res>
    extends _$LivePaymentCopyWithImpl<$Res, _$_LivePayment>
    implements _$$_LivePaymentCopyWith<$Res> {
  __$$_LivePaymentCopyWithImpl(
      _$_LivePayment _value, $Res Function(_$_LivePayment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? amount = null,
    Object? currency = null,
    Object? type = null,
    Object? technology = null,
  }) {
    return _then(_$_LivePayment(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentProcessingStatus,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      technology: null == technology
          ? _value.technology
          : technology // ignore: cast_nullable_to_non_nullable
              as PaymentTechnology,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_LivePayment extends _LivePayment {
  _$_LivePayment(
      {this.status = PaymentProcessingStatus.none,
      this.amount = 0,
      this.currency = Currency.GBP,
      this.type = PaymentType.cardPayment,
      this.technology = PaymentTechnology.card})
      : super._();

  factory _$_LivePayment.fromJson(Map<String, dynamic> json) =>
      _$$_LivePaymentFromJson(json);

  @override
  @JsonKey()
  final PaymentProcessingStatus status;
  @override
  @JsonKey()
  final num amount;
  @override
  @JsonKey()
  final Currency currency;
  @override
  @JsonKey()
  final PaymentType type;
  @override
  @JsonKey()
  final PaymentTechnology technology;

  @override
  String toString() {
    return 'LivePayment(status: $status, amount: $amount, currency: $currency, type: $type, technology: $technology)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LivePayment &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.technology, technology) ||
                other.technology == technology));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, amount, currency, type, technology);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LivePaymentCopyWith<_$_LivePayment> get copyWith =>
      __$$_LivePaymentCopyWithImpl<_$_LivePayment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LivePaymentToJson(
      this,
    );
  }
}

abstract class _LivePayment extends LivePayment {
  factory _LivePayment(
      {final PaymentProcessingStatus status,
      final num amount,
      final Currency currency,
      final PaymentType type,
      final PaymentTechnology technology}) = _$_LivePayment;
  _LivePayment._() : super._();

  factory _LivePayment.fromJson(Map<String, dynamic> json) =
      _$_LivePayment.fromJson;

  @override
  PaymentProcessingStatus get status;
  @override
  num get amount;
  @override
  Currency get currency;
  @override
  PaymentType get type;
  @override
  PaymentTechnology get technology;
  @override
  @JsonKey(ignore: true)
  _$$_LivePaymentCopyWith<_$_LivePayment> get copyWith =>
      throw _privateConstructorUsedError;
}
