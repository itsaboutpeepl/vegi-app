import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/past_order_state.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';

final pastOrdersReducer = combineReducers<PastOrderState>([
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
    allPastOrders: action.allPastOrders,
    
    lastRefreshTime: DateTime.now(),
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
