import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class OrderConfirmedViewModel extends Equatable {
  const OrderConfirmedViewModel({
    required this.selectedSlot,
    required this.isDelivery,
    required this.orderAddress,
    required this.restaurantName,
    required this.cartItems,
    required this.cartTotal,
    required this.orderID,
    required this.clearCart,
    required this.userName,
  });

  factory OrderConfirmedViewModel.fromStore(Store<AppState> store) {
    return OrderConfirmedViewModel(
      selectedSlot: store.state.cartState.selectedTimeSlot,
      isDelivery: store.state.cartState.isDelivery,
      orderAddress: store.state.cartState.isDelivery
          ? store.state.cartState.selectedDeliveryAddress!
          : store.state.cartState.restaurantAddress!,
      restaurantName: store.state.cartState.restaurantName,
      cartItems: store.state.cartState.cartItems,
      cartTotal: store.state.cartState.cartTotal,
      orderID: store.state.cartState.orderID,
      userName: store.state.userState.displayName,
      clearCart: () {
        store.dispatch(ClearCart());
      },
    );
  }

  final TimeSlot? selectedSlot;
  final bool isDelivery;
  final DeliveryAddresses orderAddress;
  final String restaurantName;
  final List<CartItem> cartItems;
  final int cartTotal;
  final String orderID;
  final void Function() clearCart;
  final String userName;

  @override
  List<Object> get props => [];
}
