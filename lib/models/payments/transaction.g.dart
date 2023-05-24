// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      amount: json['amount'] as num,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      rewards: GreenBeanToken.fromJson(json['rewards'] as Map<String, dynamic>),
      paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['paymentStatus']),
      paymentCreatedTimeStamp:
          DateTime.parse(json['paymentCreatedTimeStamp'] as String),
      paymentCompletedTimeStamp:
          DateTime.parse(json['paymentCompletedTimeStamp'] as String),
      receiverId: json['receiverId'] as String,
      payerId: json['payerId'] as String,
      paymentNetworkType:
          $enumDecode(_$PaymentNetworkTypeEnumMap, json['paymentNetworkType']),
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'rewards': instance.rewards.toJson(),
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'paymentCreatedTimeStamp':
          instance.paymentCreatedTimeStamp.toIso8601String(),
      'paymentCompletedTimeStamp':
          instance.paymentCompletedTimeStamp.toIso8601String(),
      'receiverId': instance.receiverId,
      'payerId': instance.payerId,
      'paymentNetworkType':
          _$PaymentNetworkTypeEnumMap[instance.paymentNetworkType]!,
    };

const _$CurrencyEnumMap = {
  Currency.GBP: 'GBP',
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
  Currency.GBPx: 'GBPx',
  Currency.PPL: 'PPL',
  Currency.GBT: 'GBT',
  Currency.FUSE: 'FUSE',
  Currency.percent: 'percent',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.succeeded: 'succeeded',
  PaymentStatus.failed: 'failed',
  PaymentStatus.confirmed: 'confirmed',
};

const _$PaymentNetworkTypeEnumMap = {
  PaymentNetworkType.peepl_fuse: 'peepl_fuse',
  PaymentNetworkType.vegi_fuse: 'vegi_fuse',
  PaymentNetworkType.stripe: 'stripe',
};
