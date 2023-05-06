import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/past_order_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';

final pastOrdersReducer = combineReducers<PastOrderState>([
  TypedReducer<PastOrderState, CreateOrder>(_createOrder),
  TypedReducer<PastOrderState, UpdateOngoingOrderList>(_updateOngoingOrderList),
  TypedReducer<PastOrderState, UpdateScheduledOrders>(_updateScheduledOrders),
  TypedReducer<PastOrderState, AddAllPastOrdersList>(_updatePastOrders),
  TypedReducer<PastOrderState, SetConfirmed>(_toggleConfirmed),
  TypedReducer<PastOrderState, UpdateTransactionHistory>(
      _updateTransactionHistory),
]);

List<Order> updateOrder({
  required SetConfirmed action,
  required List<Order> orders,
}) {
  final separate = orders.separateElement(
    (element) => element.id == action.orderId,
  );

  final existingOrder = separate.item1;
  if (existingOrder == null) {
    return orders;
  }
  final existingScheduledOrders = separate.item2.toList()
    ..add(
      existingOrder.copyWith(
        paymentStatus:
            action.flag ? OrderPaidStatus.paid : OrderPaidStatus.failed,
        paidDateTime: action.flag ? DateTime.now() : null,
      ),
    );
  return existingScheduledOrders;
}

PastOrderState _toggleConfirmed(
  PastOrderState state,
  SetConfirmed action,
) {
  final listOfScheduledOrders =
      updateOrder(action: action, orders: state.listOfScheduledOrders);
  final listOfOngoingOrders =
      updateOrder(action: action, orders: state.listOfOngoingOrders);
  final allPastOrders =
      updateOrder(action: action, orders: state.allPastOrders);
  return state.copyWith(
    listOfScheduledOrders: listOfScheduledOrders,
    listOfOngoingOrders: listOfOngoingOrders,
    allPastOrders: allPastOrders,
  );
}

PastOrderState _updateOngoingOrderList(
  PastOrderState state,
  UpdateOngoingOrderList action,
) {
  return state.copyWith(
    listOfOngoingOrders: action.listOfOngoingOrders,
    lastRefreshTime: DateTime.now(),
  );
}

PastOrderState _updateScheduledOrders(
  PastOrderState state,
  UpdateScheduledOrders action,
) {
  return state.copyWith(
    listOfScheduledOrders: action.listOfScheduledOrders,
    lastRefreshTime: DateTime.now(),
  );
}

PastOrderState _updatePastOrders(
  PastOrderState state,
  AddAllPastOrdersList action,
) {
  return state.copyWith(
    allPastOrders: action.pastOrders,
    listOfScheduledOrders: action.scheduledOrders,
    listOfOngoingOrders: action.ongoingOrders,
    lastRefreshTime: DateTime.now(),
  );
}

PastOrderState _createOrder(
  PastOrderState state,
  CreateOrder action,
) {
  final existingScheduledOrders = state.listOfScheduledOrders
      .where(
        (element) => element.id != action.order.id,
      )
      .toList()
    ..add(action.order);
  return state.copyWith(
    listOfScheduledOrders: existingScheduledOrders,
  );
}

PastOrderState _updateTransactionHistory(
  PastOrderState state,
  UpdateTransactionHistory action,
) {
  return state.copyWith(
    transactionHistory: action.transactionHistory,
    lastRefreshTime: DateTime.now(),
  );
}
