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
}

class SetMenuItem {
  SetMenuItem({required this.menuItem, required this.selectedExtras});
  final RestaurantMenuItem menuItem;
  final List<bool> selectedExtras;
}

class UpdateTotalPrice {
  UpdateTotalPrice({required this.totalPrice, required this.totalRewards});
  final int totalPrice;
  final int totalRewards;
}

class UpdateQuantity {
  UpdateQuantity(this.quantity);
  final int quantity;
}

class UpdateMenuItemWithProductOptions {
  UpdateMenuItemWithProductOptions(this.menuItem);
  final RestaurantMenuItem menuItem;
}

ThunkAction<AppState> fetchProductOptions(String itemID) {
  return (Store<AppState> store) async {
    try {
      final List<ProductOptionsCategory> listOfProductOptionCategories =
          await peeplEatsService.getProductOptions(itemID);

      if (store.state.menuItemState.menuItem != null) {
        final RestaurantMenuItem currentItem =
            store.state.menuItemState.menuItem!;

        final RestaurantMenuItem newItem = currentItem.copyWith(
          listOfProductOptions: listOfProductOptionCategories,
        );

        store.dispatch(UpdateMenuItemWithProductOptions(newItem));
      }
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
        total = store.state.menuItemState.quantity * menuItem.price;

        store.state.menuItemState.selectedProductOptionsForCategory
            .forEach((int optionID, ProductOptions productOptions) {
          total += productOptions.price;
        });

        store.dispatch(
          UpdateTotalPrice(
            totalPrice: total,
            totalRewards: total * 5 ~/ 100,
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
