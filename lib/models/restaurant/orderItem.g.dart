// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItem _$$_OrderItemFromJson(Map<String, dynamic> json) => _$_OrderItem(
      internalID: json['internalID'] as int,
      menuItem: MenuItem.fromJson(json['menuItem']),
      totalItemPrice: json['totalItemPrice'] as int,
      itemQuantity: json['itemQuantity'] as int,
      selectedOptions: Map<String, int>.from(json['selectedOptions'] as Map),
    );

Map<String, dynamic> _$$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'internalID': instance.internalID,
      'menuItem': instance.menuItem.toJson(),
      'totalItemPrice': instance.totalItemPrice,
      'itemQuantity': instance.itemQuantity,
      'selectedOptions': instance.selectedOptions,
    };
