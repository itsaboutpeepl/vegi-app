import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/cart/orderItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'order.freezed.dart';
part 'order.g.dart';

String getFulfilmentMethodString(
  Map<dynamic, dynamic> json,
  String key,
) {
  return json[key]['methodType'] as String? ?? 'none';
}

DateTime _toTS(int json) => json.toTimeStamp();
DateTime? _toTSNullable(int? json) => json?.toTimeStamp();
// DateTime _slotFromTime(Map<String, dynamic> json) =>
//     DateTimeHelpers.parseISOFormat((json['fulfilmentSlotFrom'] as String));
// DateTime _slotToTime(Map<String, dynamic> json) =>
//     DateTimeHelpers.parseISOFormat((json['fulfilmentSlotFrom'] as String));

@Freezed()
class Order with _$Order {
  @JsonSerializable()
  factory Order({
    required int id,
    required List<OrderItem> items,
    required num total,
    required num subtotal,
    @JsonKey(fromJson: _toTS)
        required DateTime orderedDateTime,
    @JsonKey(fromJson: _toTSNullable)
        DateTime? paidDateTime,
    @JsonKey(fromJson: _toTSNullable)
        DateTime? refundDateTime,
    required String? deliveryName,
    required String? deliveryEmail,
    required String? deliveryPhoneNumber,
    required String deliveryAddressLineOne,
    required String deliveryAddressLineTwo,
    required String deliveryAddressCity,
    required String deliveryAddressPostCode,
    required String deliveryAddressInstructions,
    required String deliveryId,
    @JsonEnum()
    @JsonKey(
      unknownEnumValue: OrderPaidStatus.unpaid,
    )
        required OrderPaidStatus paymentStatus,
    @JsonEnum()
    @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
        required RestaurantAcceptedStatus restaurantAcceptanceStatus,
    required bool deliveryPartnerAccepted,
    required bool deliveryPartnerConfirmed,
    required DateTime fulfilmentSlotFrom, // "2022-09-29T10:00:00.000Z"
    required DateTime fulfilmentSlotTo, // "2022-09-29T10:00:00.000Z"
    required String publicId,
    required int tipAmount,
    required double rewardsIssued,
    required bool sentToDeliveryPartner,
    required VendorDTO vendor,
    required DeliveryPartnerDTO? deliveryPartner,
    @JsonKey(readValue: getFulfilmentMethodString)
        required FulfilmentMethodType fulfilmentMethod,

    //ignore following keys:
    // required String customerWalletAddress,
    // required String paymentIntentId,
    // required String completedFlag,
    // required String completedOrderFeedback,
    // required double? orderCondition,
    // required double? deliveryPunctuality,
    // required String? discount,
    // required int fulfilmentMethod,
    // required int? parentOrder,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  //SECTION custom getter names for app readability
  String get restaurantName => vendorName;
  String get orderID => id.toString();
  String? get restaurantPhoneNumber => vendorPhoneNumber;
  String get paymentStatusLabel => paymentStatus.name.capitalize();
  bool get isCollection => fulfilmentMethod == FulfilmentMethodType.collection;

  int get vendorId => vendor.id;
  String get vendorName => vendor.name;
  String? get vendorPhoneNumber => vendor.phoneNumber;
  int? get deliveryPartnerId => deliveryPartner?.id;
  String? get deliveryPartnerName => deliveryPartner?.name;
}
