import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/past_order_state.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';

final pastOrdersReducer = combineReducers<PastOrderState>([
  TypedReducer<PastOrderState, UpdateOngoingOrderList>(_updateOngoingOrderList),
  TypedReducer<PastOrderState, UpdateScheduledOrders>(_updateScheduledOrders),
]);

PastOrderState _updateOngoingOrderList(
  PastOrderState state,
  UpdateOngoingOrderList action,
) {
  return state.copyWith(listOfOngoingOrders: action.listOfOngoingOrders);
}

PastOrderState _updateScheduledOrders(
  PastOrderState state,
  UpdateScheduledOrders action,
) {
  return state.copyWith(listOfScheduledOrders: action.listOfScheduledOrders);
}
