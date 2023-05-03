import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';

part 'orderStatus.freezed.dart';
part 'orderStatus.g.dart';

@Freezed()
class OrderStatus with _$OrderStatus {
  @JsonSerializable()
  factory OrderStatus({
    required RestaurantAcceptanceStatus restaurantAcceptanceStatus,
    required OrderAcceptanceStatus orderAcceptanceStatus,
    required OrderPaidStatus paymentStatus,
  }) = _OrderStatus;

  const OrderStatus._();

  factory OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);
}
