import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/past_order_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';

final pastOrdersReducer = combineReducers<PastOrderState>([
  TypedReducer<PastOrderState, CreateOrder>(_createOrder),
  TypedReducer<PastOrderState, UpdateOngoingOrderList>(_updateOngoingOrderList),
  TypedReducer<PastOrderState, UpdateScheduledOrders>(_updateScheduledOrders),
  TypedReducer<PastOrderState, AddAllPastOrdersList>(_updatePastOrders),
  TypedReducer<PastOrderState, UpdateTransactionHistory>(
      _updateTransactionHistory),
]);

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
