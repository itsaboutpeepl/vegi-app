import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class OrderConfirmedViewModel extends Equatable {
  final Map<String, String> selectedSlot;
  final bool isDelivery;
  final DeliveryAddresses orderAddress;
  final String restaurantName;
  final List<OrderItem> cartItems;
  final int cartTotal;
  final String orderID;
  final Function() clearCart;
  final String userName;
  final String phoneNumber;
  final double GBPxAmountPaid;
  final double PPLAmountPaid;

  OrderConfirmedViewModel({
    required this.selectedSlot,
    required this.isDelivery,
    required this.orderAddress,
    required this.restaurantName,
    required this.cartItems,
    required this.cartTotal,
    required this.orderID,
    required this.clearCart,
    required this.userName,
    required this.phoneNumber,
    required this.GBPxAmountPaid,
    required this.PPLAmountPaid,
  });

  static OrderConfirmedViewModel fromStore(Store<AppState> store) {
    bool tempIsDelivery =
        store.state.cartState.selectedDeliveryAddressIndex == 0 ? false : true;

    return OrderConfirmedViewModel(
      selectedSlot: tempIsDelivery
          ? store.state.cartState
              .deliverySlots[store.state.cartState.selectedSlotIndex]
          : store.state.cartState
              .collectionSlots[store.state.cartState.selectedSlotIndex],
      isDelivery: tempIsDelivery,
      orderAddress: tempIsDelivery
          ? store.state.userState.listOfDeliveryAddresses[
              store.state.cartState.selectedDeliveryAddressIndex - 1]
          : store.state.cartState.restaurantAddress,
      restaurantName: store.state.cartState.restaurantName,
      cartItems: store.state.cartState.cartItems,
      cartTotal: store.state.cartState.cartTotal,
      orderID: store.state.cartState.orderID,
      userName: store.state.userState.displayName,
      phoneNumber: store.state.userState.phoneNumber,
      GBPxAmountPaid: store.state.cartState.selectedGBPxAmount,
      PPLAmountPaid: store.state.cartState.selectedPPLAmount,
      clearCart: () {
        store.dispatch(ClearCart());
      },
    );
  }

  @override
  List<Object> get props => [];
}
