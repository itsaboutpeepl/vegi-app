// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_method_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripePaymentMethodCard _$$_StripePaymentMethodCardFromJson(
        Map<String, dynamic> json) =>
    _$_StripePaymentMethodCard(
      brand: json['brand'] as String?,
      checks: json['checks'] == null
          ? null
          : StripePaymentMethodCardCheck.fromJson(
              json['checks'] as Map<String, dynamic>),
      country: json['country'] as String?,
      exp_month: json['exp_month'] as int?,
      exp_year: json['exp_year'] as int?,
      fingerprint: json['fingerprint'] as String?,
      funding: json['funding'] as String?,
      last4: json['last4'] as String?,
      three_d_secure_usage:
          json['three_d_secure_usage'] as Map<String, dynamic>? ??
              const {'supported': true},
    );

Map<String, dynamic> _$$_StripePaymentMethodCardToJson(
        _$_StripePaymentMethodCard instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'checks': instance.checks?.toJson(),
      'country': instance.country,
      'exp_month': instance.exp_month,
      'exp_year': instance.exp_year,
      'fingerprint': instance.fingerprint,
      'funding': instance.funding,
      'last4': instance.last4,
      'three_d_secure_usage': instance.three_d_secure_usage,
    };
