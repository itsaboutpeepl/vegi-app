import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:redux/redux.dart';

class ResetMenuItem {
  ResetMenuItem();
}

class SetMenuItem {
  final MenuItem menuItem;
  final List<bool> selectedExtras;
  SetMenuItem({required this.menuItem, required this.selectedExtras});
}

class UpdateTotalPrice {
  final int totalPrice;
  final int totalRewards;
  UpdateTotalPrice({required this.totalPrice, required this.totalRewards});
}

class UpdateQuantity {
  final int quantity;
  UpdateQuantity(this.quantity);
}

class UpdateMenuItemWithProductOptions {
  final MenuItem menuItem;
  UpdateMenuItemWithProductOptions(this.menuItem);
}

ThunkAction fetchProductOptions(String itemID) {
  return (Store store) async {
    try {
      List<ProductOptionsCategory> listOfProductOptionCategories = await peeplEatsService.getProductOptions(itemID);

      MenuItem currentItem = store.state.menuItemState.menuItem;

      MenuItem newItem = currentItem.copyWith(listOfProductOptions: listOfProductOptionCategories);

      store.dispatch(UpdateMenuItemWithProductOptions(newItem));
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

ThunkAction updateComputeQuantity(bool isAdd) {
  return (Store store) async {
    try {
      int oldQuantity = store.state.menuItemState.quantity;

      isAdd
          ? oldQuantity++
          : oldQuantity <= 1
              ? null
              : oldQuantity--;

      store.dispatch(UpdateQuantity(oldQuantity));
      store.dispatch(calculateItemTotalPrice());
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

ThunkAction calculateItemTotalPrice() {
  return (Store store) async {
    try {
      int total = 0;

      total = store.state.menuItemState.quantity * store.state.menuItemState.menuItem.price;

      store.state.menuItemState.selectedProductOptionsForCategory
          .forEach((int optionID, ProductOptions productOptions) {
        total += productOptions.price;
      });

      store.dispatch(
        UpdateTotalPrice(
          totalPrice: total,
          totalRewards: (total * 5 ~/ 100),
        ),
      );
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

ThunkAction setUpMenuItemStructures(MenuItem? menuItem) {
  return (Store store) async {
    try {
      menuItem == null
          ? store.dispatch(ResetMenuItem())
          : store.dispatch(
              SetMenuItem(
                menuItem: menuItem,
                selectedExtras: List.generate(menuItem.extras.length, (i) => false),
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
