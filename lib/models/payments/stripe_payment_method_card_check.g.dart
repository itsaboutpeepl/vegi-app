// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_method_card_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripePaymentMethodCardCheck _$$_StripePaymentMethodCardCheckFromJson(
        Map<String, dynamic> json) =>
    _$_StripePaymentMethodCardCheck(
      address_line1_check: $enumDecodeNullable(
              _$StripePaymentMethodCardChecksEnumMap,
              json['address_line1_check']) ??
          StripePaymentMethodCardChecks.unchecked,
      address_postal_code_check: $enumDecodeNullable(
              _$StripePaymentMethodCardChecksEnumMap,
              json['address_postal_code_check']) ??
          StripePaymentMethodCardChecks.unchecked,
      cvc_check: $enumDecodeNullable(
              _$StripePaymentMethodCardChecksEnumMap, json['cvc_check']) ??
          StripePaymentMethodCardChecks.unchecked,
    );

Map<String, dynamic> _$$_StripePaymentMethodCardCheckToJson(
        _$_StripePaymentMethodCardCheck instance) =>
    <String, dynamic>{
      'address_line1_check':
          _$StripePaymentMethodCardChecksEnumMap[instance.address_line1_check]!,
      'address_postal_code_check': _$StripePaymentMethodCardChecksEnumMap[
          instance.address_postal_code_check]!,
      'cvc_check': _$StripePaymentMethodCardChecksEnumMap[instance.cvc_check]!,
    };

const _$StripePaymentMethodCardChecksEnumMap = {
  StripePaymentMethodCardChecks.pass: 'pass',
  StripePaymentMethodCardChecks.fail: 'fail',
  StripePaymentMethodCardChecks.unavailable: 'unavailable',
  StripePaymentMethodCardChecks.unchecked: 'unchecked',
};
