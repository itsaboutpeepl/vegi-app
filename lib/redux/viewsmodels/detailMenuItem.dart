import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';

class DetailMenuItem extends Equatable {
  final MenuItem menuItem;
  final int totalPrice;
  final int itemReward;
  final int quantity;
  final Map<int, ProductOptions> selectedOptions;
  final Function(List<OrderItem> itemsToAdd) addOrderItems;
  final Function(MenuItem? menuItem) setMenuItem;
  final Function() resetMenuItem;
  final Function(bool isAdd) updateQuantity;
  final Function() reCalcTotals;

  DetailMenuItem({
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
  });

  static DetailMenuItem fromStore(Store<AppState> store) {
    return DetailMenuItem(
      menuItem: store.state.menuItemState.menuItem,
      totalPrice: store.state.menuItemState.totalPrice,
      itemReward: store.state.menuItemState.itemReward,
      quantity: store.state.menuItemState.quantity,
      selectedOptions: store.state.menuItemState.selectedProductOptionsForCategory,
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
        store.dispatch(updateComputeQuantity(isAdd));
      },
      reCalcTotals: () {
        store.dispatch(calculateItemTotalPrice());
      },
    );
  }

  @override
  List<Object> get props => [menuItem, totalPrice, itemReward, quantity];
}
