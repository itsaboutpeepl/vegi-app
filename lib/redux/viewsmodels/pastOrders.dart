import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

class PastOrdersViewmodel extends Equatable {
  final List<OrderDetails> listOfScheduledOrders;
  final OrderDetails? ongoingOrderDetails;
  final bool hasOngoingOrder;

  PastOrdersViewmodel({
    required this.listOfScheduledOrders,
    required this.ongoingOrderDetails,
    required this.hasOngoingOrder,
  });

  static PastOrdersViewmodel fromStore(Store<AppState> store) {
    return PastOrdersViewmodel(
      listOfScheduledOrders: store.state.pastOrderState.listOfScheduledOrders,
      ongoingOrderDetails: store.state.pastOrderState.ongoingOrderDetails,
      hasOngoingOrder: store.state.pastOrderState.ongoingOrderDetails == null ? false : true,
    );
  }

  @override
  List<Object> get props => [
        listOfScheduledOrders,
        hasOngoingOrder,
      ];
}
