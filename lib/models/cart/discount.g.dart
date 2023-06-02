// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Discount _$$_DiscountFromJson(Map<String, dynamic> json) => _$_Discount(
      id: json['id'] as int,
      code: json['code'] as String,
      value: json['value'] as num,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      discountType: $enumDecode(_$DiscountTypeEnumMap, json['discountType']),
      expiryDateTime: jsonToTimeStamp(json['expiryDateTime']),
      timesUsed: json['timesUsed'] as int?,
      maxUses: json['maxUses'] as int?,
      isEnabled: json['isEnabled'] as bool? ?? false,
      linkedWalletAddress: json['linkedWalletAddress'] as String?,
      vendor: json['vendor'] == null
          ? null
          : VendorDTO.fromJson(json['vendor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DiscountToJson(_$_Discount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'value': instance.value,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'discountType': _$DiscountTypeEnumMap[instance.discountType]!,
      'expiryDateTime': timeStampToJsonInt(instance.expiryDateTime),
      'timesUsed': instance.timesUsed,
      'maxUses': instance.maxUses,
      'isEnabled': instance.isEnabled,
      'linkedWalletAddress': instance.linkedWalletAddress,
      'vendor': instance.vendor?.toJson(),
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

const _$DiscountTypeEnumMap = {
  DiscountType.percentage: 'percentage',
  DiscountType.fixed: 'fixed',
};