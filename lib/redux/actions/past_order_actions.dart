import 'dart:async';

import 'package:redux_thunk/redux_thunk.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/services.dart';

class UpdateOngoingOrderList {
  final List<OrderDetails> listOfOngoingOrders;
  UpdateOngoingOrderList(this.listOfOngoingOrders);
}

class UpdateScheduledOrders {
  final List<OrderDetails> listOfScheduledOrders;
  UpdateScheduledOrders(this.listOfScheduledOrders);
}

ThunkAction startScheduleCheckCall() {
  return (Store store) async {
    List<OrderDetails> listOfScheduledOrders = store.state.pastOrderState.listOfScheduledOrders;
    List<OrderDetails> listOfOngoingOrders = store.state.pastOrderState.listOfOngoingOrders;

    listOfScheduledOrders.forEach((element) {
      if (!isScheduledDelivery(element.selectedSlot)) {
        listOfOngoingOrders.add(element);
      }
    });

    store.dispatch(UpdateOngoingOrderList(listOfOngoingOrders));

    if (listOfOngoingOrders.isNotEmpty) {
      listOfOngoingOrders.forEach(
        (ongoingOrderElement) {
          listOfScheduledOrders
              .removeWhere((scheduledOrderElement) => scheduledOrderElement.orderID == ongoingOrderElement);
        },
      );
    }

    store.dispatch(UpdateScheduledOrders(listOfScheduledOrders));
  };
}

ThunkAction startOngoingOrderCheck() {
  return (Store store) async {
    if (store.state.pastOrderState.listOfOngoingOrders.isEmpty) return; //if empty return
    ongoingOrderCheck(store);
    Timer.periodic(const Duration(minutes: 2), (timer) {
      if (store.state.pastOrderState.listOfOngoingOrders
          .isEmpty) //if its changed during when the timer is running, then cancel timer
        timer.cancel();
      else {
        ongoingOrderCheck(store);
      }
    });
  };
}

void ongoingOrderCheck(Store store) {
  List<OrderDetails> newList = [];
  store.state.pastOrderState.listOfOngoingOrders.forEach(
    //for each order in listOfOngoingOrders
    (OrderDetails element) {
      if (!shouldEndOngoing(element.selectedSlot)) {
        //check if the order end time slot has passed the current time.
        peeplEatsService.checkOrderStatus(element.orderID).then(
          (orderStatus) {
            //if it has not passed the current time, then check the status of the order
            if (orderStatus["restaurantAcceptanceStatus"] != element.orderAcceptanceStatus.name) {
              newList.add(
                //create a new element with status changed, add it to the list, and update the list state.
                element.copyWith(
                  orderAcceptanceStatus: OrderAcceptanceStatusHelpers.enumValueFromString(
                    orderStatus['restaurantAcceptanceStatus'],
                  ),
                ),
              );
            } //if it has passed the timeslot, then its not added to the list and removed by default.
          },
        );
      }
    },
  );

  store.dispatch(UpdateOngoingOrderList(newList)); //update the list
  newList.clear(); //clear the list cause its a periodic func
}
