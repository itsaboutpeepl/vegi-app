import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

class PastOrdersViewmodel extends Equatable {
  final List<OrderDetails> listOfScheduledOrders;
  final List<OrderDetails> listOfOngoingOrders;
  final bool hasOngoingOrder;

  PastOrdersViewmodel({
    required this.listOfScheduledOrders,
    required this.listOfOngoingOrders,
    required this.hasOngoingOrder,
  });

  static PastOrdersViewmodel fromStore(Store<AppState> store) {
    return PastOrdersViewmodel(
      listOfScheduledOrders: store.state.pastOrderState.listOfScheduledOrders,
      listOfOngoingOrders: store.state.pastOrderState.listOfOngoingOrders,
      hasOngoingOrder: store.state.pastOrderState.listOfOngoingOrders.isEmpty ? false : true,
    );
  }

  @override
  List<Object> get props => [
        listOfScheduledOrders,
        listOfOngoingOrders,
        hasOngoingOrder,
      ];
}


//How to do multiple concurrent orders with live order status for each of them?

// User creates an order
// After the order confirmed page, home page shows ONE PreparingOrderAppBar
// At this point in time, you need to do a couple of things
// Start a timer that checks the order status every 5 minutes until it is accepted or declined
//