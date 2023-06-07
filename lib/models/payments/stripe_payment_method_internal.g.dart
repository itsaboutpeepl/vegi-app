// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_method_internal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripePaymentMethodInternal _$$_StripePaymentMethodInternalFromJson(
        Map<String, dynamic> json) =>
    _$_StripePaymentMethodInternal(
      id: json['id'] as String,
      type: $enumDecode(_$StripePaymentMethodTypeEnumMap, json['type']),
      billingDetails: json['billing_details'] == null
          ? null
          : StripeBillingDetails.fromJson(
              json['billing_details'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : StripePaymentMethodCard.fromJson(
              json['card'] as Map<String, dynamic>),
      customer: json['customer'] as String?,
      created: json['created'] as num? ?? 0,
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_StripePaymentMethodInternalToJson(
        _$_StripePaymentMethodInternal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$StripePaymentMethodTypeEnumMap[instance.type]!,
      'billing_details': instance.billingDetails?.toJson(),
      'card': instance.card?.toJson(),
      'customer': instance.customer,
      'created': instance.created,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
    };

const _$StripePaymentMethodTypeEnumMap = {
  StripePaymentMethodType.acss_debit: 'acss_debit',
  StripePaymentMethodType.affirm: 'affirm',
  StripePaymentMethodType.afterpay_clearpay: 'afterpay_clearpay',
  StripePaymentMethodType.alipay: 'alipay',
  StripePaymentMethodType.au_becs_debit: 'au_becs_debit',
  StripePaymentMethodType.bacs_debit: 'bacs_debit',
  StripePaymentMethodType.bancontact: 'bancontact',
  StripePaymentMethodType.blik: 'blik',
  StripePaymentMethodType.boleto: 'boleto',
  StripePaymentMethodType.card: 'card',
  StripePaymentMethodType.card_present: 'card_present',
  StripePaymentMethodType.cashapp: 'cashapp',
  StripePaymentMethodType.customer_balance: 'customer_balance',
  StripePaymentMethodType.eps: 'eps',
  StripePaymentMethodType.fpx: 'fpx',
  StripePaymentMethodType.giropay: 'giropay',
  StripePaymentMethodType.grabpay: 'grabpay',
  StripePaymentMethodType.ideal: 'ideal',
  StripePaymentMethodType.interac_present: 'interac_present',
  StripePaymentMethodType.klarna: 'klarna',
  StripePaymentMethodType.konbini: 'konbini',
  StripePaymentMethodType.link: 'link',
  StripePaymentMethodType.oxxo: 'oxxo',
  StripePaymentMethodType.p24: 'p24',
  StripePaymentMethodType.paynow: 'paynow',
  StripePaymentMethodType.paypal: 'paypal',
  StripePaymentMethodType.pix: 'pix',
  StripePaymentMethodType.promptpay: 'promptpay',
  StripePaymentMethodType.sepa_debit: 'sepa_debit',
  StripePaymentMethodType.sofort: 'sofort',
  StripePaymentMethodType.us_bank_account: 'us_bank_account',
  StripePaymentMethodType.wechat_pay: 'wechat_pay',
  StripePaymentMethodType.zip: 'zip',
};
