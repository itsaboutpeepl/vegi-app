import 'dart:async';

import 'package:redux_thunk/redux_thunk.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:redux/redux.dart';

class SetOngoingOrder {
  final OrderDetails? orderDetails;
  SetOngoingOrder(this.orderDetails);
}

class UpdateScheduledOrders {
  final List<OrderDetails> listOfScheduledOrders;
  UpdateScheduledOrders(this.listOfScheduledOrders);
}

ThunkAction startScheduleCheckCall() {
  return (Store store) async {
    List<OrderDetails> listOfScheduledOrders = store.state.pastOrderState.listOfScheduledOrders;

    listOfScheduledOrders.forEach((element) {
      if (!isScheduledDelivery(element.selectedSlot)) {
        store.dispatch(SetOngoingOrder(element));
        return;
      }
    });

    if (listOfScheduledOrders.contains(store.state.pastOrderState.ongoingOrderDetails)) {
      listOfScheduledOrders.remove(store.state.pastOrderState.ongoingOrderDetails);
    }

    store.dispatch(UpdateScheduledOrders(listOfScheduledOrders));
  };
}

ThunkAction startRemoveOngoingOrderCheck() {
  return (Store store) async {
    if (store.state.pastOrderState.ongoingOrderDetails == null) return;
    Timer.periodic(Duration(minutes: 2), (timer) {
      shouldEndOngoing(store.state.pastOrderState.ongoingOrderDetails.selectedSlot)
          ? store.dispatch(SetOngoingOrder(null))
          : null;
    });
  };
}
