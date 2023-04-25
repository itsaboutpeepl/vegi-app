// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripePaymentIntent _$$_StripePaymentIntentFromJson(
        Map<String, dynamic> json) =>
    _$_StripePaymentIntent(
      customer: json['customer'] as String,
      ephemeralKey: json['ephemeralKey'] as String,
      publishableKey: json['publishableKey'] as String,
      paymentIntent: StripePaymentIntentInternal.fromJson(
          json['paymentIntent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StripePaymentIntentToJson(
        _$_StripePaymentIntent instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'ephemeralKey': instance.ephemeralKey,
      'publishableKey': instance.publishableKey,
      'paymentIntent': instance.paymentIntent.toJson(),
    };
