// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetails _$$_OrderDetailsFromJson(Map<String, dynamic> json) =>
    _$_OrderDetails(
      selectedSlot: Map<String, String>.from(json['selectedSlot'] as Map),
      isDelivery: json['isDelivery'] as bool,
      orderAddress: DeliveryAddresses.fromJson(json['orderAddress']),
      restaurantName: json['restaurantName'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e))
          .toList(),
      cartTotal: json['cartTotal'] as int,
      orderID: json['orderID'] as String,
      userName: json['userName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      GBPxAmountPaid: (json['GBPxAmountPaid'] as num).toDouble(),
      PPLAmountPaid: (json['PPLAmountPaid'] as num).toDouble(),
      orderAcceptanceStatus: $enumDecode(
          _$OrderAcceptanceStatusEnumMap, json['orderAcceptanceStatus']),
    );

Map<String, dynamic> _$$_OrderDetailsToJson(_$_OrderDetails instance) =>
    <String, dynamic>{
      'selectedSlot': instance.selectedSlot,
      'isDelivery': instance.isDelivery,
      'orderAddress': instance.orderAddress.toJson(),
      'restaurantName': instance.restaurantName,
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'cartTotal': instance.cartTotal,
      'orderID': instance.orderID,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'GBPxAmountPaid': instance.GBPxAmountPaid,
      'PPLAmountPaid': instance.PPLAmountPaid,
      'orderAcceptanceStatus':
          _$OrderAcceptanceStatusEnumMap[instance.orderAcceptanceStatus],
    };

const _$OrderAcceptanceStatusEnumMap = {
  OrderAcceptanceStatus.pending: 'pending',
  OrderAcceptanceStatus.accepted: 'accepted',
  OrderAcceptanceStatus.declined: 'declined',
};
