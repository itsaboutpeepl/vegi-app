// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LivePayment _$$_LivePaymentFromJson(Map<String, dynamic> json) =>
    _$_LivePayment(
      status: $enumDecodeNullable(
              _$PaymentProcessingStatusEnumMap, json['status']) ??
          PaymentProcessingStatus.none,
      amount: json['amount'] as num? ?? 0,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.GBP,
      type: $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']) ??
          PaymentType.cardPayment,
      technology:
          $enumDecodeNullable(_$PaymentTechnologyEnumMap, json['technology']) ??
              PaymentTechnology.card,
    );

Map<String, dynamic> _$$_LivePaymentToJson(_$_LivePayment instance) =>
    <String, dynamic>{
      'status': _$PaymentProcessingStatusEnumMap[instance.status]!,
      'amount': instance.amount,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'type': _$PaymentTypeEnumMap[instance.type]!,
      'technology': _$PaymentTechnologyEnumMap[instance.technology]!,
    };

const _$PaymentProcessingStatusEnumMap = {
  PaymentProcessingStatus.started: 'started',
  PaymentProcessingStatus.none: 'none',
  PaymentProcessingStatus.succeeded: 'succeeded',
  PaymentProcessingStatus.failed: 'failed',
};

const _$CurrencyEnumMap = {
  Currency.GBP: 'GBP',
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
  Currency.GBPx: 'GBPx',
  Currency.PPL: 'PPL',
  Currency.GBT: 'GBT',
  Currency.FUSE: 'FUSE',
};

const _$PaymentTypeEnumMap = {
  PaymentType.topup: 'topup',
  PaymentType.cardPayment: 'cardPayment',
  PaymentType.refund: 'refund',
};

const _$PaymentTechnologyEnumMap = {
  PaymentTechnology.applePay: 'applePay',
  PaymentTechnology.googlePay: 'googlePay',
  PaymentTechnology.card: 'card',
  PaymentTechnology.fuse: 'fuse',
  PaymentTechnology.stripeOnRamp: 'stripeOnRamp',
};
