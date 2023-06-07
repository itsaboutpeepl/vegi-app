// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stripe_payment_method_card_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StripePaymentMethodCardCheck _$StripePaymentMethodCardCheckFromJson(
    Map<String, dynamic> json) {
  return _StripePaymentMethodCardCheck.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentMethodCardCheck {
  StripePaymentMethodCardChecks get address_line1_check =>
      throw _privateConstructorUsedError;
  StripePaymentMethodCardChecks get address_postal_code_check =>
      throw _privateConstructorUsedError;
  StripePaymentMethodCardChecks get cvc_check =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentMethodCardCheckCopyWith<StripePaymentMethodCardCheck>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentMethodCardCheckCopyWith<$Res> {
  factory $StripePaymentMethodCardCheckCopyWith(
          StripePaymentMethodCardCheck value,
          $Res Function(StripePaymentMethodCardCheck) then) =
      _$StripePaymentMethodCardCheckCopyWithImpl<$Res,
          StripePaymentMethodCardCheck>;
  @useResult
  $Res call(
      {StripePaymentMethodCardChecks address_line1_check,
      StripePaymentMethodCardChecks address_postal_code_check,
      StripePaymentMethodCardChecks cvc_check});
}

/// @nodoc
class _$StripePaymentMethodCardCheckCopyWithImpl<$Res,
        $Val extends StripePaymentMethodCardCheck>
    implements $StripePaymentMethodCardCheckCopyWith<$Res> {
  _$StripePaymentMethodCardCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address_line1_check = null,
    Object? address_postal_code_check = null,
    Object? cvc_check = null,
  }) {
    return _then(_value.copyWith(
      address_line1_check: null == address_line1_check
          ? _value.address_line1_check
          : address_line1_check // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardChecks,
      address_postal_code_check: null == address_postal_code_check
          ? _value.address_postal_code_check
          : address_postal_code_check // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardChecks,
      cvc_check: null == cvc_check
          ? _value.cvc_check
          : cvc_check // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardChecks,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StripePaymentMethodCardCheckCopyWith<$Res>
    implements $StripePaymentMethodCardCheckCopyWith<$Res> {
  factory _$$_StripePaymentMethodCardCheckCopyWith(
          _$_StripePaymentMethodCardCheck value,
          $Res Function(_$_StripePaymentMethodCardCheck) then) =
      __$$_StripePaymentMethodCardCheckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StripePaymentMethodCardChecks address_line1_check,
      StripePaymentMethodCardChecks address_postal_code_check,
      StripePaymentMethodCardChecks cvc_check});
}

/// @nodoc
class __$$_StripePaymentMethodCardCheckCopyWithImpl<$Res>
    extends _$StripePaymentMethodCardCheckCopyWithImpl<$Res,
        _$_StripePaymentMethodCardCheck>
    implements _$$_StripePaymentMethodCardCheckCopyWith<$Res> {
  __$$_StripePaymentMethodCardCheckCopyWithImpl(
      _$_StripePaymentMethodCardCheck _value,
      $Res Function(_$_StripePaymentMethodCardCheck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address_line1_check = null,
    Object? address_postal_code_check = null,
    Object? cvc_check = null,
  }) {
    return _then(_$_StripePaymentMethodCardCheck(
      address_line1_check: null == address_line1_check
          ? _value.address_line1_check
          : address_line1_check // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardChecks,
      address_postal_code_check: null == address_postal_code_check
          ? _value.address_postal_code_check
          : address_postal_code_check // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardChecks,
      cvc_check: null == cvc_check
          ? _value.cvc_check
          : cvc_check // ignore: cast_nullable_to_non_nullable
              as StripePaymentMethodCardChecks,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_StripePaymentMethodCardCheck extends _StripePaymentMethodCardCheck {
  _$_StripePaymentMethodCardCheck(
      {this.address_line1_check = StripePaymentMethodCardChecks.unchecked,
      this.address_postal_code_check = StripePaymentMethodCardChecks.unchecked,
      this.cvc_check = StripePaymentMethodCardChecks.unchecked})
      : super._();

  factory _$_StripePaymentMethodCardCheck.fromJson(Map<String, dynamic> json) =>
      _$$_StripePaymentMethodCardCheckFromJson(json);

  @override
  @JsonKey()
  final StripePaymentMethodCardChecks address_line1_check;
  @override
  @JsonKey()
  final StripePaymentMethodCardChecks address_postal_code_check;
  @override
  @JsonKey()
  final StripePaymentMethodCardChecks cvc_check;

  @override
  String toString() {
    return 'StripePaymentMethodCardCheck(address_line1_check: $address_line1_check, address_postal_code_check: $address_postal_code_check, cvc_check: $cvc_check)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StripePaymentMethodCardCheck &&
            (identical(other.address_line1_check, address_line1_check) ||
                other.address_line1_check == address_line1_check) &&
            (identical(other.address_postal_code_check,
                    address_postal_code_check) ||
                other.address_postal_code_check == address_postal_code_check) &&
            (identical(other.cvc_check, cvc_check) ||
                other.cvc_check == cvc_check));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address_line1_check, address_postal_code_check, cvc_check);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StripePaymentMethodCardCheckCopyWith<_$_StripePaymentMethodCardCheck>
      get copyWith => __$$_StripePaymentMethodCardCheckCopyWithImpl<
          _$_StripePaymentMethodCardCheck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StripePaymentMethodCardCheckToJson(
      this,
    );
  }
}

abstract class _StripePaymentMethodCardCheck
    extends StripePaymentMethodCardCheck {
  factory _StripePaymentMethodCardCheck(
          {final StripePaymentMethodCardChecks address_line1_check,
          final StripePaymentMethodCardChecks address_postal_code_check,
          final StripePaymentMethodCardChecks cvc_check}) =
      _$_StripePaymentMethodCardCheck;
  _StripePaymentMethodCardCheck._() : super._();

  factory _StripePaymentMethodCardCheck.fromJson(Map<String, dynamic> json) =
      _$_StripePaymentMethodCardCheck.fromJson;

  @override
  StripePaymentMethodCardChecks get address_line1_check;
  @override
  StripePaymentMethodCardChecks get address_postal_code_check;
  @override
  StripePaymentMethodCardChecks get cvc_check;
  @override
  @JsonKey(ignore: true)
  _$$_StripePaymentMethodCardCheckCopyWith<_$_StripePaymentMethodCardCheck>
      get copyWith => throw _privateConstructorUsedError;
}
