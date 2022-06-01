import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

part 'menu_item_state.freezed.dart';
part 'menu_item_state.g.dart';

@freezed
class MenuItemState with _$MenuItemState {
  const MenuItemState._();

  @JsonSerializable()
  factory MenuItemState({
    required RestaurantMenuItem menuItem,
    required int totalPrice,
    required int itemReward,
    required Map<int, ProductOptions> selectedProductOptionsForCategory,
    required int quantity,
  }) = _MenuItemState;

  factory MenuItemState.initial() => MenuItemState(
        menuItem: bagel1,
        totalPrice: 0,
        itemReward: 0,
        quantity: 0,
        selectedProductOptionsForCategory: {},
      );

  factory MenuItemState.fromJson(dynamic json) => _$MenuItemStateFromJson(json);
}

class MenuItemStateConverter implements JsonConverter<MenuItemState, Map<String, dynamic>?> {
  const MenuItemStateConverter();

  @override
  MenuItemState fromJson(Map<String, dynamic>? json) => MenuItemState.initial();

  @override
  Map<String, dynamic> toJson(MenuItemState instance) => instance.toJson();
}
