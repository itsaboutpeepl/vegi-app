// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_order_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PastOrderState _$$_PastOrderStateFromJson(Map<String, dynamic> json) =>
    _$_PastOrderState(
      lastRefreshTime: DateTime.parse(json['lastRefreshTime'] as String),
      listOfScheduledOrders: (json['listOfScheduledOrders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      listOfOngoingOrders: (json['listOfOngoingOrders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allPastOrders: (json['allPastOrders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allUnpaidOrders: (json['allUnpaidOrders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      transactionHistory: (json['transactionHistory'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PastOrderStateToJson(_$_PastOrderState instance) =>
    <String, dynamic>{
      'lastRefreshTime': instance.lastRefreshTime.toIso8601String(),
      'listOfScheduledOrders':
          instance.listOfScheduledOrders.map((e) => e.toJson()).toList(),
      'listOfOngoingOrders':
          instance.listOfOngoingOrders.map((e) => e.toJson()).toList(),
      'allPastOrders': instance.allPastOrders.map((e) => e.toJson()).toList(),
      'allUnpaidOrders':
          instance.allUnpaidOrders.map((e) => e.toJson()).toList(),
      'transactionHistory':
          instance.transactionHistory.map((e) => e.toJson()).toList(),
    };
