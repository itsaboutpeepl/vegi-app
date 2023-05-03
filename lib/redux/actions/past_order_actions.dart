import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/payments/transaction.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class UpdateOngoingOrderList {
  UpdateOngoingOrderList(this.listOfOngoingOrders);
  final List<Order> listOfOngoingOrders;
}

class UpdateScheduledOrders {
  UpdateScheduledOrders(this.listOfScheduledOrders);
  final List<Order> listOfScheduledOrders;
}

class UpdateOrderPaymentStatus {
  UpdateOrderPaymentStatus({
    required this.orderId,
    required this.paymentIntentId,
    required this.status,
  });

  final String orderId;
  final String paymentIntentId;
  final PaymentStatus status;
}

class AddAllPastOrdersList {
  AddAllPastOrdersList(this.allPastOrders);
  final List<Order> allPastOrders;
}

class UpdateTransactionHistory {
  UpdateTransactionHistory(this.transactionHistory);
  final List<Transaction> transactionHistory;
}

ThunkAction<AppState> updateOrderPaymentStatus({
  required String orderId,
  required String paymentIntentId,
  required PaymentStatus status,
  required void Function() successHandler,
  required void Function(String) errorHandler,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        UpdateOrderPaymentStatus(
          orderId: orderId,
          paymentIntentId: paymentIntentId,
          status: status,
        ),
      );

      successHandler();
    } catch (e, s) {
      log.error('ERROR - updateOrderPaymentStatus $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateOrderPaymentStatus $e',
      );
      errorHandler(
        'ERROR - updateOrderPaymentStatus $e',
      );
    }
  };
}

// ThunkAction<AppState> createNewPastOrder() { //TODO: remove this call and refactor the orderConfirmed.dart screen to get the latest order on the page and not by creating in the store,
//   return (Store<AppState> store) async {
//     final OrderDetails orderDetails = OrderDetails(
//       selectedSlot: store.state.cartState.selectedTimeSlot!,
//       isDelivery: store.state.cartState.isDelivery,
//       orderAddress: store.state.cartState.isDelivery
//           ? store.state.cartState.selectedDeliveryAddress!
//           : store.state.cartState.restaurantAddress!,
//       restaurantName: store.state.cartState.restaurantName,
//       cartItems: store.state.cartState.cartItems,
//       cartTotal: store.state.cartState.cartTotal,
//       orderID: store.state.cartState.orderID,
//       userName: store.state.userState.displayName,
//       phoneNumber: store.state.cartState.isDelivery
//           ? store.state.userState.phoneNumber
//           : store.state.cartState.restaurantAddress!.townCity,
//       GBPxAmountPaid: store.state.cartState.selectedGBPxAmount,
//       PPLAmountPaid: store.state.cartState.selectedPPLAmount,
//       orderAcceptanceStatus: OrderAcceptanceStatus.pending,
//     );

//     if (isScheduledDelivery(orderDetails.selectedSlot)) {
//       final List<OrderDetails> listOfScheduledOrders = List<OrderDetails>.from(
//         store.state.pastOrderState.listOfScheduledOrders,
//       )..add(orderDetails);
//       store.dispatch(UpdateScheduledOrders(listOfScheduledOrders));
//     } else {
//       final List<OrderDetails> listOfOngoingOrders = List<OrderDetails>.from(
//         store.state.pastOrderState.listOfOngoingOrders,
//       )..add(orderDetails);
//       store.dispatch(UpdateOngoingOrderList(listOfOngoingOrders));
//     }
//   };
// }

ThunkAction<AppState> startScheduleCheckCall() {
  return (Store<AppState> store) async {
    final List<Order> listOfScheduledOrders =
        store.state.pastOrderState.listOfScheduledOrders;
    final List<Order> listOfOngoingOrders =
        store.state.pastOrderState.listOfOngoingOrders;

    for (final Order element in listOfScheduledOrders) {
      if (!isScheduledDelivery(element.timeSlot)) {
        listOfOngoingOrders.add(element);
      }
    }

    store.dispatch(UpdateOngoingOrderList(listOfOngoingOrders));

    if (listOfOngoingOrders.isNotEmpty) {
      for (final Order ongoingOrderElement in listOfOngoingOrders) {
        listOfScheduledOrders.removeWhere(
          (scheduledOrderElement) =>
              scheduledOrderElement.orderID == ongoingOrderElement.orderID,
        );
      }
    }

    store.dispatch(UpdateScheduledOrders(listOfScheduledOrders));
  };
}

ThunkAction<AppState> startOngoingOrderCheck() {
  return (Store<AppState> store) async {
    if (store.state.pastOrderState.listOfOngoingOrders.isEmpty) {
      return;
    } //if empty return
    ongoingOrderCheck(store);
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (store.state.pastOrderState.listOfOngoingOrders.isEmpty) {
        timer.cancel();
      } else {
        ongoingOrderCheck(store);
      }
    });
  };
}

ThunkAction<AppState> fetchAllOrdersForWallet(
  String walletAddress,
  void Function() successHandler,
  void Function(String, FetchOrdersVegiResponseEnum) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      final listOfOrders =
          (await peeplEatsService.getOrdersForWallet(walletAddress))
              .reversed
              .toList();

      store.dispatch(AddAllPastOrdersList(listOfOrders));

      successHandler();
    } catch (e, s) {
      log.error('ERROR - fetchAllOrdersForWallet $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchAllOrdersForWallet $e',
      );
      errorHandler(
        'ERROR - fetchAllOrdersForWallet $e',
        FetchOrdersVegiResponseEnum.error,
      );
    }
  };
}

void ongoingOrderCheck(Store<AppState> store) {
  final List<Order> newList = [];
  for (final Order element in store.state.pastOrderState.listOfOngoingOrders) {
    if (!shouldEndOngoing(element.timeSlot)) {
      //check if the order end time slot has passed the current time.
      peeplEatsService.checkOrderStatus(element.orderID).then(
        (orderStatus) {
          //if it has not passed the current time, then check the status of the order
          if (orderStatus.orderAcceptanceStatus !=
              element.orderAcceptanceStatus.name) {
            newList.add(
              //create a new element with status changed, add it to the list, and update the list state.
              element.copyWith(
                orderAcceptanceStatus:
                  orderStatus.orderAcceptanceStatus,
              ),
            );
          } //if it has passed the timeslot, then its not added to the list and removed by default.
        },
      );
    }
  }

  store.dispatch(UpdateOngoingOrderList(newList)); //update the list
  newList.clear(); //clear the list cause its a periodic func
}
