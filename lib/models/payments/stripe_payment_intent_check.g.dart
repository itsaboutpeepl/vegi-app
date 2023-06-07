// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_intent_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripePaymentIntentCheck _$$_StripePaymentIntentCheckFromJson(
        Map<String, dynamic> json) =>
    _$_StripePaymentIntentCheck(
      paymentIntent: StripePaymentIntentInternal.fromJson(
          json['paymentIntent'] as Map<String, dynamic>),
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
              ?.map((e) => StripePaymentMethodInternal.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_StripePaymentIntentCheckToJson(
        _$_StripePaymentIntentCheck instance) =>
    <String, dynamic>{
      'paymentIntent': instance.paymentIntent.toJson(),
      'paymentMethods': instance.paymentMethods.map((e) => e.toJson()).toList(),
    };
