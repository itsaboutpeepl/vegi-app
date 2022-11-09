import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart' as cartActions;

class CartItemListViewModel extends Equatable {
  const CartItemListViewModel({
    required this.names,
    required this.prices,
    required this.optionValues,
    required this.ids,
    required this.addCartItem,
    required this.removeCartItem,
  });

  factory CartItemListViewModel.fromStore(Store<AppState> store) {
    final cartItems = store.state.cartState.cartItems;
    final List<String> itemNames = [];
    final List<String> itemPrices = [];
    final List<List<String>> optionValues = [];
    final List<int> itemIds = [];

    for (final cartItem in cartItems) {
      itemIds.add(cartItem.internalID);
      itemPrices.add(cartItem.formattedPrice);
      itemNames.add(cartItem.menuItem.name.capitalizeWords());
      optionValues.add(cartItem.selectedProductOptionsString);
    }

    return CartItemListViewModel(
      names: itemNames,
      prices: itemPrices,
      optionValues: optionValues,
      ids: itemIds,
      addCartItem: (int id) => store.dispatch(
        cartActions.addDuplicateCartItem(id),
      ),
      removeCartItem: (id) => store.dispatch(
        cartActions.removeCartItem(id),
      ),
    );
  }

  final List<String> names;
  final List<String> prices;
  final List<List<String>> optionValues;
  final List<int> ids;
  final void Function(int id) addCartItem;
  final void Function(int id) removeCartItem;

  @override
  List<Object?> get props => [ids];
}
