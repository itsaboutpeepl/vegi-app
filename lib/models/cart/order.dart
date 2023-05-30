import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/discount.dart';
import 'package:vegan_liverpool/models/cart/fulfilmentMethod.dart';
import 'package:vegan_liverpool/models/cart/orderItem.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/payments/transaction_item.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'order.freezed.dart';
part 'order.g.dart';

List<Order> fromJsonOrderList(dynamic json) =>
    fromSailsListOfObjectJson<Order>(Order.fromJson)(json);
Order? fromJsonOrder(dynamic json) =>
    fromSailsObjectJson<Order>(Order.fromJson)(json);

OrderCompletedFlag orderCompletedFlagFromJson(dynamic json) =>
    OrderCompletedFlagHelpers.enumValueFromString(
      json == null ? '' : json.toString(),
    );
String orderCompletedFlagToJson(OrderCompletedFlag flag) =>
    flag == OrderCompletedFlag.partiallyRefunded
        ? 'partially refunded'
        : flag.name;

String getFulfilmentMethodString(
  Map<dynamic, dynamic> json,
  String key,
) {
  return json[key]['methodType'] as String? ?? 'none';
}

int getFulfilmentMethodId(
  Map<dynamic, dynamic> json,
  String key,
) {
  return json['fulfilmentMethod']['id']! as int;
}

num getFulfilmentMethodPriceModifier(
  Map<dynamic, dynamic> json,
  String key,
) {
  return (json['fulfilmentMethod']['priceModifier'] ?? 0.0) as num;
}

// DateTime _slotFromTime(Map<String, dynamic> json) =>
//     DateTimeHelpers.parseISOFormat((json['fulfilmentSlotFrom'] as String));
// DateTime _slotToTime(Map<String, dynamic> json) =>
//     DateTimeHelpers.parseISOFormat((json['fulfilmentSlotFrom'] as String));

@Freezed()
class Order with _$Order {
  @JsonSerializable()
  factory Order({
    required int id,
    required num total,
    required num subtotal,
    @JsonKey(
      fromJson: jsonToTimeStamp,
      toJson: timeStampToJsonInt,
    )
        required DateTime orderedDateTime,
    @JsonKey(
      fromJson: jsonToTimeStampNullable,
      toJson: timeStampToJsonIntNullable,
    )
        DateTime? paidDateTime,
    @JsonKey(
      fromJson: jsonToTimeStampNullable,
      toJson: timeStampToJsonIntNullable,
    )
        DateTime? refundDateTime,
    @JsonEnum()
    @JsonKey(
      unknownEnumValue: OrderPaidStatus.unpaid,
    )
        required OrderPaidStatus paymentStatus,
    required String paymentIntentId,
    required String? firebaseRegistrationToken,
    required String? deliveryName,
    required String? deliveryEmail,
    required String? deliveryPhoneNumber,
    required String deliveryAddressLineOne,
    required String? deliveryAddressLineTwo,
    required String deliveryAddressCity,
    required String deliveryAddressPostCode,
    required double? deliveryAddressLatitude,
    required double? deliveryAddressLongitude,
    required String? deliveryAddressInstructions,
    required String? deliveryId,
    required bool deliveryPartnerAccepted,
    required bool deliveryPartnerConfirmed,
    required String customerWalletAddress,
    required String publicId,
    @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
        required RestaurantAcceptanceStatus restaurantAcceptanceStatus,
    @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
        required OrderAcceptanceStatus orderAcceptanceStatus,
    required int tipAmount,
    required double rewardsIssued,
    required bool sentToDeliveryPartner,
    @JsonKey(
      fromJson: orderCompletedFlagFromJson,
      toJson: orderCompletedFlagToJson,
    )
        required OrderCompletedFlag completedFlag,
    required String? completedOrderFeedback,
    required int? deliveryPunctuality,
    required int? orderCondition,
    required DateTime fulfilmentSlotFrom, // "2022-09-29T10:00:00.000Z"
    required DateTime fulfilmentSlotTo, // "2022-09-29T10:00:00.000Z"
    @JsonKey(fromJson: fromJsonFulfilmentMethod)
        required FulfilmentMethod? fulfilmentMethod,
    @JsonKey(fromJson: fromJsonVendorDTO)
        required VendorDTO? vendor,
    @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
        required DeliveryPartnerDTO? deliveryPartner,
    @JsonKey(fromJson: fromJsonDiscountList)
    @Default([])
        List<Discount> discounts,
    @JsonKey(fromJson: fromJsonOrderItemList)
        required List<OrderItem> items,
    @JsonKey(fromJson: fromJsonOrder)
    @Default(null)
        Order? parentOrder,
    @JsonKey(fromJson: fromJsonOrderItemList)
    @Default([])
        List<OrderItem> unfulfilledItems,
    @JsonKey(fromJson: fromJsonTransactionItemList)
    @Default([])
        List<TransactionItem> transactions,
    required num fulfilmentCharge,
    required num platformFee,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => tryCatchRethrowInline(
        () => _$OrderFromJson(json),
      );

  int get fulfilmentMethodId => fulfilmentMethod?.id ?? 0;
  num? get fulfilmentMethodPriceModifier =>
      fulfilmentMethod?.priceModifier ?? 0;
  FulfilmentMethodType get fulfilmentMethodType =>
      fulfilmentMethod?.methodType ?? FulfilmentMethodType.none;

  List<String> get cartDiscountCodes =>
      discounts.map((discount) => discount.code).toList();
  List<DiscountType> get cartDiscountTypes =>
      discounts.map((discount) => discount.discountType).toList();
  Future<Money> get cartDiscountAmount =>
      discounts.map((discount) => discount.moneyAmount).sum();

  num get GBPAmountPaid => transactions.isEmpty
      ? total / 100
      : transactions
              .where((t) => t.currency == Currency.GBPx)
              .map((t) => t.amount / 100)
              .sum() +
          transactions
              .where((t) => t.currency == Currency.GBP)
              .map((t) => t.amount)
              .sum();
  num get GBPxAmountPaid => GBPAmountPaid * 100;
  num get PPLAmountPaid => transactions
      .where((t) => t.currency == Currency.PPL)
      .map((t) => t.amount)
      .sum();

  double get rewardsEarnedInPPL => getPPLRewardsFromPounds(
        GBPAmountPaid,
      );

  String get rewardsEarnedInPPLFormatted =>
      rewardsEarnedInPPL.toStringAsFixed(2);

  String get pplRewardsEarnedValue =>
      '£${getPoundValueFromPPL(rewardsEarnedInPPL).toStringAsFixed(2)}';

  bool get didUsePPL => PPLAmountPaid != 0.0;

  //SECTION custom getter names for app readability
  String get restaurantName => vendorName;
  String get orderID => id.toString();
  String? get restaurantPhoneNumber => vendorPhoneNumber;
  String get paymentStatusLabel => paymentStatus.name.capitalize();
  bool get isCollection =>
      fulfilmentMethod?.methodType == FulfilmentMethodType.collection;
  bool get isDelivery =>
      fulfilmentMethod?.methodType == FulfilmentMethodType.delivery;
  bool get isInStore =>
      fulfilmentMethod?.methodType == FulfilmentMethodType.inStore;
  int get cartTotalGBPx => total.round();
  int get cartTotalGBP => (total / 100).round();
  int get cartSubTotalGBPx => subtotal.round();
  int get cartSubTotalGBP => (subtotal / 100).round();

  int get vendorId => vendor?.id ?? 0;
  String get vendorName => vendor?.name ?? '';
  String? get vendorPhoneNumber => vendor?.phoneNumber;
  int? get deliveryPartnerId => deliveryPartner?.id;
  String? get deliveryPartnerName => deliveryPartner?.name;

  TimeSlot get timeSlot => TimeSlot(
        startTime: fulfilmentSlotFrom,
        endTime: fulfilmentSlotTo,
        priceModifier: fulfilmentMethodPriceModifier?.round() ?? 0,
        fulfilmentMethodId: fulfilmentMethodId,
      );

  DeliveryAddresses get address => DeliveryAddresses(
        internalID:
            Random(DateTime.now().millisecondsSinceEpoch).nextInt(10000),
        label: DeliveryAddressLabel.hotel,
        name: deliveryName,
        email: deliveryEmail,
        instructions: deliveryAddressInstructions,
        phoneNumber: deliveryPhoneNumber,
        addressLine1: deliveryAddressLineOne,
        addressLine2: deliveryAddressLineTwo ?? '',
        townCity: deliveryAddressCity,
        postalCode: deliveryAddressPostCode,
        latitude: deliveryAddressLatitude ?? 0.0,
        longitude: deliveryAddressLongitude ?? 0.0,
      );
}
