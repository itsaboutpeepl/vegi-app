// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItem _$$_OrderItemFromJson(Map<String, dynamic> json) => _$_OrderItem(
      internalID: json['internalID'] as int,
      menuItem: RestaurantMenuItem.fromJson(json['menuItem']),
      totalItemPrice: json['totalItemPrice'] as int,
      itemQuantity: json['itemQuantity'] as int,
      selectedProductOptions:
          (json['selectedProductOptions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), ProductOptions.fromJson(e)),
      ),
    );

Map<String, dynamic> _$$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'internalID': instance.internalID,
      'menuItem': instance.menuItem.toJson(),
      'totalItemPrice': instance.totalItemPrice,
      'itemQuantity': instance.itemQuantity,
      'selectedProductOptions': instance.selectedProductOptions
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
    };
