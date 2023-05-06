// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionItem _$$_TransactionItemFromJson(Map<String, dynamic> json) =>
    _$_TransactionItem(
      timestamp: jsonToTimeStamp(json['timestamp']),
      amount: json['amount'] as num,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      receiver: objectIdFromJson(json['receiver']),
      payer: objectIdFromJson(json['payer']),
      order: objectIdFromJson(json['order']),
    );

Map<String, dynamic> _$$_TransactionItemToJson(_$_TransactionItem instance) =>
    <String, dynamic>{
      'timestamp': timeStampToJsonInt(instance.timestamp),
      'amount': instance.amount,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'receiver': instance.receiver,
      'payer': instance.payer,
      'order': instance.order,
    };

const _$CurrencyEnumMap = {
  Currency.GBT: 'GBT',
  Currency.PPL: 'PPL',
  Currency.GBPx: 'GBPx',
  Currency.GBP: 'GBP',
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
};
