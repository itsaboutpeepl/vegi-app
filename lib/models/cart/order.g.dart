// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as num,
      subtotal: json['subtotal'] as num,
      orderedDateTime: _toTS(json['orderedDateTime'] as int),
      paidDateTime: _toTSNullable(json['paidDateTime'] as int?),
      refundDateTime: _toTSNullable(json['refundDateTime'] as int?),
      deliveryName: json['deliveryName'] as String?,
      deliveryEmail: json['deliveryEmail'] as String?,
      deliveryPhoneNumber: json['deliveryPhoneNumber'] as String?,
      deliveryAddressLineOne: json['deliveryAddressLineOne'] as String,
      deliveryAddressLineTwo: json['deliveryAddressLineTwo'] as String,
      deliveryAddressCity: json['deliveryAddressCity'] as String,
      deliveryAddressPostCode: json['deliveryAddressPostCode'] as String,
      deliveryAddressInstructions:
          json['deliveryAddressInstructions'] as String,
      deliveryId: json['deliveryId'] as String,
      paymentStatus: $enumDecode(
          _$OrderPaidStatusEnumMap, json['paymentStatus'],
          unknownValue: OrderPaidStatus.unpaid),
      restaurantAcceptanceStatus: $enumDecode(
          _$RestaurantAcceptedStatusEnumMap, json['restaurantAcceptanceStatus'],
          unknownValue: RestaurantAcceptedStatus.pending),
      deliveryPartnerAccepted: json['deliveryPartnerAccepted'] as bool,
      deliveryPartnerConfirmed: json['deliveryPartnerConfirmed'] as bool,
      fulfilmentSlotFrom: DateTime.parse(json['fulfilmentSlotFrom'] as String),
      fulfilmentSlotTo: DateTime.parse(json['fulfilmentSlotTo'] as String),
      publicId: json['publicId'] as String,
      tipAmount: json['tipAmount'] as int,
      rewardsIssued: (json['rewardsIssued'] as num).toDouble(),
      sentToDeliveryPartner: json['sentToDeliveryPartner'] as bool,
      vendor: VendorDTO.fromJson(json['vendor'] as Map<String, dynamic>),
      deliveryPartner: json['deliveryPartner'] == null
          ? null
          : DeliveryPartnerDTO.fromJson(
              json['deliveryPartner'] as Map<String, dynamic>),
      fulfilmentMethod: $enumDecode(_$FulfilmentMethodTypeEnumMap,
          getFulfilmentMethodString(json, 'fulfilmentMethod')),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'subtotal': instance.subtotal,
      'orderedDateTime': instance.orderedDateTime.toIso8601String(),
      'paidDateTime': instance.paidDateTime?.toIso8601String(),
      'refundDateTime': instance.refundDateTime?.toIso8601String(),
      'deliveryName': instance.deliveryName,
      'deliveryEmail': instance.deliveryEmail,
      'deliveryPhoneNumber': instance.deliveryPhoneNumber,
      'deliveryAddressLineOne': instance.deliveryAddressLineOne,
      'deliveryAddressLineTwo': instance.deliveryAddressLineTwo,
      'deliveryAddressCity': instance.deliveryAddressCity,
      'deliveryAddressPostCode': instance.deliveryAddressPostCode,
      'deliveryAddressInstructions': instance.deliveryAddressInstructions,
      'deliveryId': instance.deliveryId,
      'paymentStatus': _$OrderPaidStatusEnumMap[instance.paymentStatus]!,
      'restaurantAcceptanceStatus': _$RestaurantAcceptedStatusEnumMap[
          instance.restaurantAcceptanceStatus]!,
      'deliveryPartnerAccepted': instance.deliveryPartnerAccepted,
      'deliveryPartnerConfirmed': instance.deliveryPartnerConfirmed,
      'fulfilmentSlotFrom': instance.fulfilmentSlotFrom.toIso8601String(),
      'fulfilmentSlotTo': instance.fulfilmentSlotTo.toIso8601String(),
      'publicId': instance.publicId,
      'tipAmount': instance.tipAmount,
      'rewardsIssued': instance.rewardsIssued,
      'sentToDeliveryPartner': instance.sentToDeliveryPartner,
      'vendor': instance.vendor.toJson(),
      'deliveryPartner': instance.deliveryPartner?.toJson(),
      'fulfilmentMethod':
          _$FulfilmentMethodTypeEnumMap[instance.fulfilmentMethod]!,
    };

const _$OrderPaidStatusEnumMap = {
  OrderPaidStatus.paid: 'paid',
  OrderPaidStatus.unpaid: 'unpaid',
  OrderPaidStatus.failed: 'failed',
};

const _$RestaurantAcceptedStatusEnumMap = {
  RestaurantAcceptedStatus.accepted: 'accepted',
  RestaurantAcceptedStatus.rejected: 'rejected',
  RestaurantAcceptedStatus.pending: 'pending',
};

const _$FulfilmentMethodTypeEnumMap = {
  FulfilmentMethodType.collection: 'collection',
  FulfilmentMethodType.delivery: 'delivery',
  FulfilmentMethodType.none: 'none',
};
