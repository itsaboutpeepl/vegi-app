import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

part 'orderDetails.freezed.dart';
part 'orderDetails.g.dart';

@Freezed()
class OrderDetails with _$OrderDetails {
  const OrderDetails._();

  @JsonSerializable()
  factory OrderDetails({
    required Map<String, String> selectedSlot,
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
  }) = _OrderDetails;

  factory OrderDetails.fromJson(dynamic json) => _$OrderDetailsFromJson(json);
}
