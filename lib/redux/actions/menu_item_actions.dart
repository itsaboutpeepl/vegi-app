import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ResetMenuItem {
  ResetMenuItem();
  @override
  String toString() => 'ResetMenuItem';
}

class SetMenuItem {
  SetMenuItem({required this.menuItem, required this.selectedExtras});
  final RestaurantMenuItem menuItem;
  final List<bool> selectedExtras;

  @override
  String toString() =>
      'SetMenuItem : menuItem: $menuItem, selectedExtras: $selectedExtras,';
}

class UpdateTotalPrice {
  UpdateTotalPrice({required this.totalPrice, required this.totalRewards});
  final int totalPrice;
  final int totalRewards;

  @override
  String toString() =>
      'UpdateTotalPrice : totalPrice: $totalPrice, totalPrice: $totalPrice';
}

class UpdateQuantity {
  UpdateQuantity(this.quantity);
  final int quantity;

  @override
  String toString() => 'UpdateQuantity : quantity: $quantity';
}

class UpdateMenuItemWithProductOptions {
  UpdateMenuItemWithProductOptions(this.menuItem);
  final RestaurantMenuItem menuItem;

  @override
  String toString() =>
      'UpdateMenuItemWithProductOptions : menuItem: $menuItem,';
}

class LoadingProductOptions {
  LoadingProductOptions({required this.flag});
  final bool flag;

  @override
  String toString() => 'LoadingProductOptions : flag: $flag';
}

ThunkAction<AppState> fetchProductOptions(String itemID) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(LoadingProductOptions(flag: true));
      final List<ProductOptionsCategory> listOfProductOptionCategories =
          await peeplEatsService.getProductOptions(itemID);

      if (store.state.menuItemState.menuItem != null) {
        final RestaurantMenuItem currentItem =
            store.state.menuItemState.menuItem!;

        final RestaurantMenuItem newItem = currentItem.copyWith(
          listOfProductOptionCategories: listOfProductOptionCategories,
        );

        store
          ..dispatch(UpdateMenuItemWithProductOptions(newItem))
          ..dispatch(LoadingProductOptions(flag: false));
      }
    } catch (e, s) {
      log.error('ERROR - fetchProductOptions $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchProductOptions $e',
      );
    }
  };
}

ThunkAction<AppState> updateComputeQuantity({required bool isAdd}) {
  return (Store<AppState> store) async {
    try {
      int oldQuantity = store.state.menuItemState.quantity;
      if (isAdd) {
        oldQuantity++;
      } else {
        if (oldQuantity <= 1) {
          return;
        } else {
          oldQuantity--;
        }
      }

      store.dispatch(UpdateQuantity(oldQuantity));
      //store.dispatch(calculateItemTotalPrice());
    } catch (e, s) {
      log.error('ERROR - updateQuantity $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateQuantity $e',
      );
    }
  };
}

ThunkAction<AppState> calculateItemTotalPrice() {
  return (Store<AppState> store) async {
    try {
      int total = 0;

      final RestaurantMenuItem? menuItem = store.state.menuItemState.menuItem;

      if (menuItem != null) {
        final totalPrice = menuItem.totalPrice(
          quantity: store.state.menuItemState.quantity,
          selectedProductOptions:
              store.state.menuItemState.selectedProductOptionsForCategory,
          fulfilmentMethod: store.state.cartState.fulfilmentMethod,
        );

        store.dispatch(
          UpdateTotalPrice(
            totalPrice: totalPrice.totalPrice,
            totalRewards: totalPrice.totalRewards,
          ),
        );
      }
    } catch (e, s) {
      log.error('ERROR - calculateItemTotalPrice $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - calculateItemTotalPrice $e',
      );
    }
  };
}

ThunkAction<AppState> setUpMenuItemStructures(RestaurantMenuItem? menuItem) {
  return (Store<AppState> store) async {
    try {
      menuItem == null
          ? store.dispatch(ResetMenuItem())
          : store.dispatch(
              SetMenuItem(
                menuItem: menuItem,
                selectedExtras:
                    List.generate(menuItem.extras.length, (i) => false),
              ),
            );
    } catch (e, s) {
      log.error('ERROR - setUpMenuItemStructures $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setUpMenuItemStructures $e',
      );
    }
  };
}
