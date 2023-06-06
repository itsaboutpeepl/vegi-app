// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_intent_internal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripePaymentIntentInternal _$$_StripePaymentIntentInternalFromJson(
        Map<String, dynamic> json) =>
    _$_StripePaymentIntentInternal(
      id: json['id'] as String,
      clientSecret: json['client_secret'] as String,
      amount: json['amount'] as num,
      currency: json['currency'] as String,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      shipping: json['shipping'] as Map<String, dynamic>? ?? const {},
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_StripePaymentIntentInternalToJson(
        _$_StripePaymentIntentInternal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_secret': instance.clientSecret,
      'amount': instance.amount,
      'currency': instance.currency,
      'metadata': instance.metadata,
      'payment_method_types': instance.paymentMethodTypes,
      'shipping': instance.shipping,
      'status': instance.status,
    };
