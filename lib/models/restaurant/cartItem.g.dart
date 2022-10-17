// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      internalID: json['internalID'] as int,
      menuItem:
          RestaurantMenuItem.fromJson(json['menuItem'] as Map<String, dynamic>),
      totalItemPrice: json['totalItemPrice'] as int,
      itemQuantity: json['itemQuantity'] as int,
      selectedProductOptions:
          (json['selectedProductOptions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), ProductOptions.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'internalID': instance.internalID,
      'menuItem': instance.menuItem.toJson(),
      'totalItemPrice': instance.totalItemPrice,
      'itemQuantity': instance.itemQuantity,
      'selectedProductOptions': instance.selectedProductOptions
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
    };
