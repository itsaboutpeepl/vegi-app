import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/services.dart';

class UpdateOngoingOrderList {
  UpdateOngoingOrderList(this.listOfOngoingOrders);
  final List<OrderDetails> listOfOngoingOrders;
}

class UpdateScheduledOrders {
  UpdateScheduledOrders(this.listOfScheduledOrders);
  final List<OrderDetails> listOfScheduledOrders;
}

ThunkAction<AppState> createNewPastOrder() {
  return (Store<AppState> store) async {
    final OrderDetails orderDetails = OrderDetails(
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
      phoneNumber: store.state.cartState.isDelivery
          ? store.state.userState.phoneNumber
          : store.state.cartState.restaurantAddress!.townCity,
      GBPxAmountPaid: store.state.cartState.selectedGBPxAmount,
      PPLAmountPaid: store.state.cartState.selectedPPLAmount,
      orderAcceptanceStatus: OrderAcceptanceStatus.pending,
    );

    if (isScheduledDelivery(orderDetails.selectedSlot)) {
      final List<OrderDetails> listOfScheduledOrders = List<OrderDetails>.from(
        store.state.pastOrderState.listOfScheduledOrders,
      )..add(orderDetails);
      store.dispatch(UpdateScheduledOrders(listOfScheduledOrders));
    } else {
      final List<OrderDetails> listOfOngoingOrders = List<OrderDetails>.from(
        store.state.pastOrderState.listOfOngoingOrders,
      )..add(orderDetails);
      store.dispatch(UpdateOngoingOrderList(listOfOngoingOrders));
    }
  };
}

ThunkAction<AppState> startScheduleCheckCall() {
  return (Store<AppState> store) async {
    final List<OrderDetails> listOfScheduledOrders =
        store.state.pastOrderState.listOfScheduledOrders;
    final List<OrderDetails> listOfOngoingOrders =
        store.state.pastOrderState.listOfOngoingOrders;

    for (final OrderDetails element in listOfScheduledOrders) {
      if (!isScheduledDelivery(element.selectedSlot)) {
        listOfOngoingOrders.add(element);
      }
    }

    store.dispatch(UpdateOngoingOrderList(listOfOngoingOrders));

    if (listOfOngoingOrders.isNotEmpty) {
      for (final OrderDetails ongoingOrderElement in listOfOngoingOrders) {
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

void ongoingOrderCheck(Store<AppState> store) {
  final List<OrderDetails> newList = [];
  for (final OrderDetails element
      in store.state.pastOrderState.listOfOngoingOrders) {
    if (!shouldEndOngoing(element.selectedSlot)) {
      //check if the order end time slot has passed the current time.
      peeplEatsService.checkOrderStatus(element.orderID).then(
        (orderStatus) {
          //if it has not passed the current time, then check the status of the order
          if (orderStatus['restaurantAcceptanceStatus'] !=
              element.orderAcceptanceStatus.name) {
            newList.add(
              //create a new element with status changed, add it to the list, and update the list state.
              element.copyWith(
                orderAcceptanceStatus:
                    OrderAcceptanceStatusHelpers.enumValueFromString(
                  orderStatus['restaurantAcceptanceStatus'] as String,
                ),
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
