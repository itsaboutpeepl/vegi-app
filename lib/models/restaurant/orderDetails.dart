import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';

part 'orderDetails.freezed.dart';
part 'orderDetails.g.dart';

@Freezed()
class OrderDetails with _$OrderDetails {
  @JsonSerializable()
  factory OrderDetails({
    required TimeSlot selectedSlot,
    required bool isDelivery,
    required DeliveryAddresses orderAddress,
    required String restaurantName,
    required List<CartItem> cartItems,
    required int cartTotal,
    required String orderID,
    required String userName,
    required String phoneNumber,
    required double GBPxAmountPaid,
    required double PPLAmountPaid,
    required OrderAcceptanceStatus orderAcceptanceStatus,
  }) = _OrderDetails;

  const OrderDetails._();

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  String get pplRewardsEarned => getPPLRewardsFromPence(
        GBPxAmountPaid * 100,
      ).toStringAsFixed(2);

  String get pplRewardsEarnedValue =>
      '£${(getPPLRewardsFromPence(GBPxAmountPaid * 100) / 10).toStringAsFixed(2)}';

  bool get didUsePPL => PPLAmountPaid != 0.0;
}
