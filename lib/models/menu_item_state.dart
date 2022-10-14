import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/constants/demoData.dart';

part 'menu_item_state.freezed.dart';
part 'menu_item_state.g.dart';

@Freezed()
class MenuItemState with _$MenuItemState {
  const MenuItemState._();

  @JsonSerializable()
  factory MenuItemState({
    @JsonKey(ignore: true) @Default(null) RestaurantMenuItem? menuItem,
    @JsonKey(ignore: true) @Default(0) int totalPrice,
    @JsonKey(ignore: true) @Default(0) int itemReward,
    @JsonKey(ignore: true)
    @Default({})
        Map<int, ProductOptions> selectedProductOptionsForCategory,
    @JsonKey(ignore: true) @Default(0) int quantity,
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

class MenuItemStateConverter
    implements JsonConverter<MenuItemState, Map<String, dynamic>?> {
  const MenuItemStateConverter();

  @override
  MenuItemState fromJson(Map<String, dynamic>? json) =>
      json != null ? MenuItemState.fromJson(json) : MenuItemState.initial();

  @override
  Map<String, dynamic> toJson(MenuItemState instance) => instance.toJson();
}
