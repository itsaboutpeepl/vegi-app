import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'cartItem.freezed.dart';
part 'cartItem.g.dart';

@Freezed()
class CartItem with _$CartItem {
  @JsonSerializable()
  factory CartItem({
    required int internalID,
    required RestaurantMenuItem menuItem,
    required int totalItemPrice,
    required int itemQuantity,
    required Map<int, ProductOptions> selectedProductOptions,
  }) = _CartItem;

  const CartItem._();

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  String get formattedPrice {
    return cFPrice(totalItemPrice);
  }

  List<String> get selectedProductOptionsString {
    int _counter = 0;
    final List<String> optionValues = [];
    for (final element in selectedProductOptions.values) {
      _counter++;
      optionValues.add(
        '$_counter. ${element.name} -  ${element.description}'
            .capitalizeWords(),
      );
    }
    return optionValues;
  }
}
