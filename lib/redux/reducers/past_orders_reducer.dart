import 'package:vegan_liverpool/models/past_order_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';

final pastOrdersReducer = combineReducers<PastOrderState>([
  TypedReducer<PastOrderState, SetOngoingOrder>(_setOngoingOrder),
  TypedReducer<PastOrderState, UpdateScheduledOrders>(_updateScheduledOrders),
]);

PastOrderState _setOngoingOrder(
  PastOrderState state,
  SetOngoingOrder action,
) {
  return state.copyWith(ongoingOrderDetails: action.orderDetails);
}

PastOrderState _updateScheduledOrders(
  PastOrderState state,
  UpdateScheduledOrders action,
) {
  return state.copyWith(listOfScheduledOrders: action.listOfScheduledOrders);
}
