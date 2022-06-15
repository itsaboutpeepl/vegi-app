// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_order_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PastOrderState _$$_PastOrderStateFromJson(Map<String, dynamic> json) =>
    _$_PastOrderState(
      listOfScheduledOrders: (json['listOfScheduledOrders'] as List<dynamic>?)
              ?.map((e) => OrderDetails.fromJson(e))
              .toList() ??
          const [],
      ongoingOrderDetails: json['ongoingOrderDetails'] == null
          ? null
          : OrderDetails.fromJson(json['ongoingOrderDetails']),
    );

Map<String, dynamic> _$$_PastOrderStateToJson(_$_PastOrderState instance) =>
    <String, dynamic>{
      'listOfScheduledOrders':
          instance.listOfScheduledOrders.map((e) => e.toJson()).toList(),
      'ongoingOrderDetails': instance.ongoingOrderDetails?.toJson(),
    };
