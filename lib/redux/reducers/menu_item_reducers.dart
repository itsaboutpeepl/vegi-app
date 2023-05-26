import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/menu_item_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

final menuItemReducers = combineReducers<MenuItemState>(
  [
    TypedReducer<MenuItemState, ResetAppState>(_resetApp).call,
    TypedReducer<MenuItemState, ResetMenuItem>(_resetMenuItem).call,
    TypedReducer<MenuItemState, SetMenuItem>(_setMenuItem).call,
    TypedReducer<MenuItemState, UpdateTotalPrice>(_calculateTotalPrice).call,
    TypedReducer<MenuItemState, UpdateQuantity>(_updateQuantity).call,
    TypedReducer<MenuItemState, UpdateMenuItemWithProductOptions>(
      _updateProductOptions,
    ).call,
    TypedReducer<MenuItemState, LoadingProductOptions>(
      _setLoadingProductOptions,
    ).call,
  ],
);

MenuItemState _resetApp(
  MenuItemState state,
  ResetAppState action,
) {
  return MenuItemState.initial();
}

MenuItemState _resetMenuItem(
  MenuItemState state,
  ResetMenuItem action,
) {
  return state.copyWith(
    menuItem: null,
    totalPrice: const Money.zeroGBPx(),
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
    totalPrice: action.totalPrice.totalPrice,
    itemReward: action.totalPrice.totalRewards,
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
