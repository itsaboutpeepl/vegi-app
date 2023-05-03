// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatus _$$_OrderStatusFromJson(Map<String, dynamic> json) =>
    _$_OrderStatus(
      restaurantAcceptanceStatus: $enumDecode(
          _$RestaurantAcceptanceStatusEnumMap,
          json['restaurantAcceptanceStatus']),
      orderAcceptanceStatus: $enumDecode(
          _$OrderAcceptanceStatusEnumMap, json['orderAcceptanceStatus']),
      paymentStatus:
          $enumDecode(_$OrderPaidStatusEnumMap, json['paymentStatus']),
    );

Map<String, dynamic> _$$_OrderStatusToJson(_$_OrderStatus instance) =>
    <String, dynamic>{
      'restaurantAcceptanceStatus': _$RestaurantAcceptanceStatusEnumMap[
          instance.restaurantAcceptanceStatus]!,
      'orderAcceptanceStatus':
          _$OrderAcceptanceStatusEnumMap[instance.orderAcceptanceStatus]!,
      'paymentStatus': _$OrderPaidStatusEnumMap[instance.paymentStatus]!,
    };

const _$RestaurantAcceptanceStatusEnumMap = {
  RestaurantAcceptanceStatus.accepted: 'accepted',
  RestaurantAcceptanceStatus.rejected: 'rejected',
  RestaurantAcceptanceStatus.pending: 'pending',
  RestaurantAcceptanceStatus.partiallyFulfilled: 'partiallyFulfilled',
};

const _$OrderAcceptanceStatusEnumMap = {
  OrderAcceptanceStatus.accepted: 'accepted',
  OrderAcceptanceStatus.declined: 'declined',
  OrderAcceptanceStatus.partiallyFulfilled: 'partiallyFulfilled',
  OrderAcceptanceStatus.pending: 'pending',
  OrderAcceptanceStatus.outForDelivery: 'outForDelivery',
  OrderAcceptanceStatus.delivered: 'delivered',
  OrderAcceptanceStatus.collected: 'collected',
};

const _$OrderPaidStatusEnumMap = {
  OrderPaidStatus.paid: 'paid',
  OrderPaidStatus.unpaid: 'unpaid',
  OrderPaidStatus.failed: 'failed',
};
