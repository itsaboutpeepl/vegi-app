// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      id: json['id'] as int,
      menuItem:
          RestaurantMenuItem.fromJson(json['menuItem'] as Map<String, dynamic>),
      totalItemPrice: gbpxPriceFromJson(json['totalItemPrice']),
      itemQuantity: json['itemQuantity'] as int,
      itemCurrency:
          $enumDecodeNullable(_$CurrencyEnumMap, json['itemCurrency']) ??
              Currency.GBPx,
      selectedProductOptions:
          (json['selectedProductOptions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            ProductOptionValue.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menuItem': instance.menuItem.toJson(),
      'totalItemPrice': gbpxPriceToJson(instance.totalItemPrice),
      'itemQuantity': instance.itemQuantity,
      'itemCurrency': _$CurrencyEnumMap[instance.itemCurrency]!,
      'selectedProductOptions': instance.selectedProductOptions
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
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
