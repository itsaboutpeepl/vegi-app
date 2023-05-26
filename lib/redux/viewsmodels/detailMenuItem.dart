import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';

class DetailMenuItem extends Equatable {
  const DetailMenuItem({
    required this.menuItem,
    required this.totalPrice,
    required this.itemReward,
    required this.quantity,
    required this.addOrderItems,
    required this.setMenuItem,
    required this.updateQuantity,
    required this.selectedOptions,
    required this.resetMenuItem,
    required this.reCalcTotals,
    required this.loadingProductOptions,
  });

  factory DetailMenuItem.fromStore(Store<AppState> store) {
    return DetailMenuItem(
      menuItem: store.state.menuItemState.menuItem,
      totalPrice: store.state.menuItemState.totalPrice.inGBPx,
      itemReward: store.state.menuItemState.itemReward,
      quantity: store.state.menuItemState.quantity,
      selectedOptions:
          store.state.menuItemState.selectedProductOptionsForCategory,
      loadingProductOptions: store.state.menuItemState.loadingProductOptions,
      addOrderItems: (itemsToAdd) {
        store.dispatch(updateCartItems(itemsToAdd));
      },
      setMenuItem: (menuItem) {
        store.dispatch(setUpMenuItemStructures(menuItem));
      },
      resetMenuItem: () {
        store.dispatch(ResetMenuItem());
      },
      updateQuantity: (isAdd) {
        store.dispatch(updateComputeQuantity(isAdd: isAdd));
      },
      reCalcTotals: () {
        store.dispatch(calculateItemTotalPrice());
      },
    );
  }
  final RestaurantMenuItem? menuItem;
  final Money totalPrice;
  final num itemReward;
  final int quantity;
  final Map<int, ProductOptionValue> selectedOptions;
  void selectProductOption({
    required int selectedOptionCategoryId,
    required ProductOptionValue selectedProductOption,
  }) {
    selectedOptions[selectedOptionCategoryId] = selectedProductOption;
  }

  final bool loadingProductOptions;
  final void Function(List<CartItem> itemsToAdd) addOrderItems;
  final void Function(RestaurantMenuItem? menuItem) setMenuItem;
  final void Function() resetMenuItem;
  final void Function(bool isAdd) updateQuantity;
  final void Function() reCalcTotals;

  @override
  List<Object> get props => [
        menuItem!,
        totalPrice.value,
        itemReward,
        quantity,
        loadingProductOptions,
      ];
}
