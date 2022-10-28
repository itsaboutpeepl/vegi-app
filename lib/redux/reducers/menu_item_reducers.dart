import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/menu_item_state.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';

final menuItemReducers = combineReducers<MenuItemState>(
  [
    TypedReducer<MenuItemState, ResetMenuItem>(_resetMenuItem),
    TypedReducer<MenuItemState, SetMenuItem>(_setMenuItem),
    TypedReducer<MenuItemState, UpdateTotalPrice>(_calculateTotalPrice),
    TypedReducer<MenuItemState, UpdateQuantity>(_updateQuantity),
    TypedReducer<MenuItemState, UpdateMenuItemWithProductOptions>(
      _updateProductOptions,
    ),
    TypedReducer<MenuItemState, LoadingProductOptions>(
      _setLoadingProductOptions,
    ),
  ],
);

MenuItemState _resetMenuItem(
  MenuItemState state,
  ResetMenuItem action,
) {
  return state.copyWith(
    menuItem: null,
    totalPrice: 0,
    itemReward: 0,
    quantity: 0,
    selectedProductOptionsForCategory: {},
  );
}

MenuItemState _setMenuItem(
  MenuItemState state,
  SetMenuItem action,
) {
  return state.copyWith(
    menuItem: action.menuItem,
    totalPrice: action.menuItem.price,
    itemReward: action.menuItem.price * 5 ~/ 100,
    selectedProductOptionsForCategory: {},
    quantity: 1,
  );
}

MenuItemState _calculateTotalPrice(
  MenuItemState state,
  UpdateTotalPrice action,
) {
  return state.copyWith(
    totalPrice: action.totalPrice,
    itemReward: action.totalRewards,
  );
}

MenuItemState _updateQuantity(
  MenuItemState state,
  UpdateQuantity action,
) {
  return state.copyWith(quantity: action.quantity);
}

MenuItemState _updateProductOptions(
  MenuItemState state,
  UpdateMenuItemWithProductOptions action,
) {
  return state.copyWith(menuItem: action.menuItem);
}

MenuItemState _setLoadingProductOptions(
  MenuItemState state,
  LoadingProductOptions action,
) {
  return state.copyWith(loadingProductOptions: action.flag);
}
