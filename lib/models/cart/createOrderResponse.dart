import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/order.dart';

part 'createOrderResponse.freezed.dart';
part 'createOrderResponse.g.dart';

Map<String, dynamic> orderToJson(Order order) => order.toJson();

@Freezed()
class CreateOrderResponse with _$CreateOrderResponse {
  @JsonSerializable()
  factory CreateOrderResponse({
    required int orderId,
    required String paymentIntentID,
    required OrderCreationStatus orderCreationStatus,
    @JsonKey(
      fromJson: Order.fromJson,
      toJson: orderToJson,
    )
        required Order order,
  }) = _CreateOrderResponse;

  const CreateOrderResponse._();

  static bool canParse(Map<String, dynamic> json) {
    return json.containsKeyAndNotNull('orderId') &&
        json.containsKeyAndNotNull('paymentIntentID') &&
        json.containsKeyAndNotNull('orderCreationStatus');
  }

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$CreateOrderResponseFromJson(json));
}
