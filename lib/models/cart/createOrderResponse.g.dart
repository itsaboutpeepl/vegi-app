// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createOrderResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateOrderResponse _$$_CreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CreateOrderResponse(
      orderId: json['orderId'] as int,
      orderCreationStatus: $enumDecode(
          _$OrderCreationStatusEnumMap, json['orderCreationStatus']),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      stripePaymentIntent: StripePaymentIntent.fromJson(
          json['stripePaymentIntent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreateOrderResponseToJson(
        _$_CreateOrderResponse instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderCreationStatus':
          _$OrderCreationStatusEnumMap[instance.orderCreationStatus]!,
      'order': orderToJson(instance.order),
      'stripePaymentIntent': instance.stripePaymentIntent.toJson(),
    };

const _$OrderCreationStatusEnumMap = {
  OrderCreationStatus.confirmed: 'confirmed',
  OrderCreationStatus.failed: 'failed',
};
