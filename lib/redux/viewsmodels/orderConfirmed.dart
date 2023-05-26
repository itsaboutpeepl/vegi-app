import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/payments/transaction_item.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class OrderConfirmedViewModel extends Equatable {
  const OrderConfirmedViewModel({
    required this.selectedSlot,
    required this.isDelivery,
    required this.orderAddress,
    required this.restaurantName,
    required this.cartItems,
    required this.cartTotal,
    required this.cartCurrency,
    required this.orderID,
    required this.order,
    required this.clearCart,
    required this.userName,
  });

  factory OrderConfirmedViewModel.fromStore(Store<AppState> store) {
    Order? order;
    try {
      int orderDetailsInd = //BUG: Becasue we are no longer creating the orderDetails our self, we need to create it once we get the response from the createOrder call
          store.state.pastOrderState.listOfScheduledOrders.indexWhere(
        (element) => element.orderID == store.state.cartState.orderID,
      );
      if (orderDetailsInd == -1) {
        orderDetailsInd =
            store.state.pastOrderState.listOfOngoingOrders.indexWhere(
          (element) => element.orderID == store.state.cartState.orderID,
        );
      }
      if (store.state.pastOrderState.listOfOngoingOrders
          .indexExists(orderDetailsInd)) {
        order = store.state.pastOrderState.listOfOngoingOrders[orderDetailsInd];
      } else if (store.state.pastOrderState.listOfScheduledOrders
          .indexExists(orderDetailsInd)) {
        order =
            store.state.pastOrderState.listOfScheduledOrders[orderDetailsInd];
      } else if (store.state.pastOrderState.allPastOrders
          .indexExists(orderDetailsInd)) {
        order = store.state.pastOrderState.allPastOrders[orderDetailsInd];
      } else if (store.state.pastOrderState.allUnpaidOrders
          .indexExists(orderDetailsInd)) {
        order = store.state.pastOrderState.allUnpaidOrders[orderDetailsInd];
      }
    } on Exception catch (e, s) {
      log.error(e, stackTrace: s);
      log.error('Issue initialising OrderConfirmedViewModel: $e');
    }
    if (order != null && order.transactions.length < 1) {
      order.transactions.add(
        TransactionItem(
          timestamp: order.orderedDateTime,
          amount: store.state.cartState.cartTotal.value,
          currency: store.state.cartState.cartTotal.currency,
          receiver: -2,
          payer: store.state.userState.vegiAccountId?.toInt() ?? -1,
          order: order.id,
        ),
      );
    }
    return OrderConfirmedViewModel(
      selectedSlot: store.state.cartState.selectedTimeSlot,
      isDelivery: store.state.cartState.isDelivery,
      orderAddress: store.state.cartState.isDelivery
          ? (store.state.cartState.selectedDeliveryAddress ??
              store.state.cartState.restaurantAddress)
          : store.state.cartState.restaurantAddress,
      restaurantName: store.state.cartState.restaurantName,
      cartItems: store.state.cartState.cartItems,
      cartTotal: store.state.cartState.cartTotal,
      cartCurrency: store.state.cartState.cartCurrency,
      orderID: store.state.cartState.orderID,
      order: order ?? store.state.pastOrderState.listOfScheduledOrders.last,
      userName: store.state.userState.displayName,
      clearCart: () {
        store.dispatch(ClearCart());
      },
    );
  }

  final TimeSlot? selectedSlot;
  final bool isDelivery;
  final DeliveryAddresses? orderAddress;
  final String restaurantName;
  final List<CartItem> cartItems;
  final Money cartTotal;
  final Currency cartCurrency;
  final String orderID;
  final Order order;
  final void Function() clearCart;
  final String userName;

  @override
  List<Object> get props => [];
}
