// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getOrdersResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetOrdersResponse _$$_GetOrdersResponseFromJson(Map<String, dynamic> json) =>
    _$_GetOrdersResponse(
      ongoingOrders: (json['ongoingOrders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduledOrders: (json['scheduledOrders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastOrders: (json['pastOrders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      unpaidOrders: (json['unpaidOrders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetOrdersResponseToJson(
        _$_GetOrdersResponse instance) =>
    <String, dynamic>{
      'ongoingOrders': instance.ongoingOrders.map((e) => e.toJson()).toList(),
      'scheduledOrders':
          instance.scheduledOrders.map((e) => e.toJson()).toList(),
      'pastOrders': instance.pastOrders.map((e) => e.toJson()).toList(),
      'unpaidOrders': instance.unpaidOrders.map((e) => e.toJson()).toList(),
    };
