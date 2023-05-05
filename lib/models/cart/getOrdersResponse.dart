import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/cart/order.dart';

part 'getOrdersResponse.freezed.dart';
part 'getOrdersResponse.g.dart';

@Freezed()
class GetOrdersResponse with _$GetOrdersResponse {
  @JsonSerializable()
  factory GetOrdersResponse({
    required List<Order> ongoingOrders,
    required List<Order> scheduledOrders,
    required List<Order> pastOrders,
  }) = _GetOrdersResponse;

  const GetOrdersResponse._();

  factory GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseFromJson(json);
}
