// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as int,
      total: json['total'] as num,
      subtotal: json['subtotal'] as num,
      orderedDateTime: jsonToTimeStamp(json['orderedDateTime']),
      paidDateTime: jsonToTimeStampNullable(json['paidDateTime']),
      refundDateTime: jsonToTimeStampNullable(json['refundDateTime']),
      paymentStatus: $enumDecode(
          _$OrderPaidStatusEnumMap, json['paymentStatus'],
          unknownValue: OrderPaidStatus.unpaid),
      paymentIntentId: json['paymentIntentId'] as String,
      firebaseRegistrationToken: json['firebaseRegistrationToken'] as String?,
      deliveryName: json['deliveryName'] as String?,
      deliveryEmail: json['deliveryEmail'] as String?,
      deliveryPhoneNumber: json['deliveryPhoneNumber'] as String?,
      deliveryAddressLineOne: json['deliveryAddressLineOne'] as String,
      deliveryAddressLineTwo: json['deliveryAddressLineTwo'] as String?,
      deliveryAddressCity: json['deliveryAddressCity'] as String,
      deliveryAddressPostCode: json['deliveryAddressPostCode'] as String,
      deliveryAddressLatitude:
          (json['deliveryAddressLatitude'] as num?)?.toDouble(),
      deliveryAddressLongitude:
          (json['deliveryAddressLongitude'] as num?)?.toDouble(),
      deliveryAddressInstructions:
          json['deliveryAddressInstructions'] as String?,
      deliveryId: json['deliveryId'] as String?,
      deliveryPartnerAccepted: json['deliveryPartnerAccepted'] as bool,
      deliveryPartnerConfirmed: json['deliveryPartnerConfirmed'] as bool,
      customerWalletAddress: json['customerWalletAddress'] as String,
      publicId: json['publicId'] as String,
      restaurantAcceptanceStatus: $enumDecode(
          _$RestaurantAcceptanceStatusEnumMap,
          json['restaurantAcceptanceStatus'],
          unknownValue: RestaurantAcceptanceStatus.pending),
      orderAcceptanceStatus: $enumDecode(
          _$OrderAcceptanceStatusEnumMap, json['orderAcceptanceStatus'],
          unknownValue: OrderAcceptanceStatus.pending),
      tipAmount: json['tipAmount'] as int,
      rewardsIssued: (json['rewardsIssued'] as num).toDouble(),
      sentToDeliveryPartner: json['sentToDeliveryPartner'] as bool,
      completedFlag: orderCompletedFlagFromJson(json['completedFlag']),
      completedOrderFeedback: json['completedOrderFeedback'] as String?,
      deliveryPunctuality: json['deliveryPunctuality'] as int?,
      orderCondition: json['orderCondition'] as int?,
      fulfilmentSlotFrom: DateTime.parse(json['fulfilmentSlotFrom'] as String),
      fulfilmentSlotTo: DateTime.parse(json['fulfilmentSlotTo'] as String),
      fulfilmentMethod: fromJsonFulfilmentMethod(json['fulfilmentMethod']),
      vendor: fromJsonVendorDTO(json['vendor']),
      deliveryPartner: fromJsonDeliveryPartnerDTO(json['deliveryPartner']),
      discounts: json['discounts'] == null
          ? const []
          : fromJsonDiscountList(json['discounts']),
      items: fromJsonOrderItemList(json['items']),
      parentOrder: json['parentOrder'] == null
          ? null
          : fromJsonOrder(json['parentOrder']),
      unfulfilledItems: json['unfulfilledItems'] == null
          ? const []
          : fromJsonOrderItemList(json['unfulfilledItems']),
      transactions: json['transactions'] == null
          ? const []
          : fromJsonTransactionItemList(json['transactions']),
      fulfilmentCharge: json['fulfilmentCharge'] as num,
      platformFee: json['platformFee'] as num,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'subtotal': instance.subtotal,
      'orderedDateTime': timeStampToJsonInt(instance.orderedDateTime),
      'paidDateTime': timeStampToJsonIntNullable(instance.paidDateTime),
      'refundDateTime': timeStampToJsonIntNullable(instance.refundDateTime),
      'paymentStatus': _$OrderPaidStatusEnumMap[instance.paymentStatus]!,
      'paymentIntentId': instance.paymentIntentId,
      'firebaseRegistrationToken': instance.firebaseRegistrationToken,
      'deliveryName': instance.deliveryName,
      'deliveryEmail': instance.deliveryEmail,
      'deliveryPhoneNumber': instance.deliveryPhoneNumber,
      'deliveryAddressLineOne': instance.deliveryAddressLineOne,
      'deliveryAddressLineTwo': instance.deliveryAddressLineTwo,
      'deliveryAddressCity': instance.deliveryAddressCity,
      'deliveryAddressPostCode': instance.deliveryAddressPostCode,
      'deliveryAddressLatitude': instance.deliveryAddressLatitude,
      'deliveryAddressLongitude': instance.deliveryAddressLongitude,
      'deliveryAddressInstructions': instance.deliveryAddressInstructions,
      'deliveryId': instance.deliveryId,
      'deliveryPartnerAccepted': instance.deliveryPartnerAccepted,
      'deliveryPartnerConfirmed': instance.deliveryPartnerConfirmed,
      'customerWalletAddress': instance.customerWalletAddress,
      'publicId': instance.publicId,
      'restaurantAcceptanceStatus': _$RestaurantAcceptanceStatusEnumMap[
          instance.restaurantAcceptanceStatus]!,
      'orderAcceptanceStatus':
          _$OrderAcceptanceStatusEnumMap[instance.orderAcceptanceStatus]!,
      'tipAmount': instance.tipAmount,
      'rewardsIssued': instance.rewardsIssued,
      'sentToDeliveryPartner': instance.sentToDeliveryPartner,
      'completedFlag': orderCompletedFlagToJson(instance.completedFlag),
      'completedOrderFeedback': instance.completedOrderFeedback,
      'deliveryPunctuality': instance.deliveryPunctuality,
      'orderCondition': instance.orderCondition,
      'fulfilmentSlotFrom': instance.fulfilmentSlotFrom.toIso8601String(),
      'fulfilmentSlotTo': instance.fulfilmentSlotTo.toIso8601String(),
      'fulfilmentMethod': instance.fulfilmentMethod?.toJson(),
      'vendor': instance.vendor?.toJson(),
      'deliveryPartner': instance.deliveryPartner?.toJson(),
      'discounts': instance.discounts.map((e) => e.toJson()).toList(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'parentOrder': instance.parentOrder?.toJson(),
      'unfulfilledItems':
          instance.unfulfilledItems.map((e) => e.toJson()).toList(),
      'transactions': instance.transactions.map((e) => e.toJson()).toList(),
      'fulfilmentCharge': instance.fulfilmentCharge,
      'platformFee': instance.platformFee,
    };

const _$OrderPaidStatusEnumMap = {
  OrderPaidStatus.paid: 'paid',
  OrderPaidStatus.unpaid: 'unpaid',
  OrderPaidStatus.failed: 'failed',
};

const _$RestaurantAcceptanceStatusEnumMap = {
  RestaurantAcceptanceStatus.accepted: 'accepted',
  RestaurantAcceptanceStatus.rejected: 'rejected',
  RestaurantAcceptanceStatus.pending: 'pending',
  RestaurantAcceptanceStatus.partiallyFulfilled: 'partiallyFulfilled',
  RestaurantAcceptanceStatus.cancelledByUser: 'cancelledByUser',
};

const _$OrderAcceptanceStatusEnumMap = {
  OrderAcceptanceStatus.accepted: 'accepted',
  OrderAcceptanceStatus.declined: 'declined',
  OrderAcceptanceStatus.partiallyFulfilled: 'partiallyFulfilled',
  OrderAcceptanceStatus.cancelledByUser: 'cancelledByUser',
  OrderAcceptanceStatus.pending: 'pending',
  OrderAcceptanceStatus.outForDelivery: 'outForDelivery',
  OrderAcceptanceStatus.delivered: 'delivered',
  OrderAcceptanceStatus.collected: 'collected',
};
