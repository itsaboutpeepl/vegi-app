import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';

part 'orderItem.freezed.dart';
part 'orderItem.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const OrderItem._();

  @JsonSerializable()
  factory OrderItem({
    required MenuItem menuItem,
    required int totalItemPrice,
    required int itemQuantity,
    required Map<String, int> selectedOptions,
  }) = _OrderItem;

  factory OrderItem.fromJson(dynamic json) => _$OrderItemFromJson(json);
}
