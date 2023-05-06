import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/payments/transaction.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

part 'past_order_state.freezed.dart';
part 'past_order_state.g.dart';

@Freezed()
class PastOrderState with _$PastOrderState {
  @JsonSerializable()
  factory PastOrderState({
    required DateTime lastRefreshTime,
    @Default([]) List<Order> listOfScheduledOrders,
    @Default([]) List<Order> listOfOngoingOrders,
    @Default([]) List<Order> allPastOrders,
    @Default([]) List<Transaction> transactionHistory,
  }) = _PastOrderState;

  const PastOrderState._();

  factory PastOrderState.initial() => PastOrderState(
        lastRefreshTime: DateTime.now(),
        listOfScheduledOrders: [],
        listOfOngoingOrders: [],
        allPastOrders: [],
        transactionHistory: [],
      );

  factory PastOrderState.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$PastOrderStateFromJson(json),
      );
}

class PastOrderStateConverter
    implements JsonConverter<PastOrderState, Map<String, dynamic>?> {
  const PastOrderStateConverter();

  @override
  PastOrderState fromJson(Map<String, dynamic>? json) => tryCatchRethrowInline(
        () => json != null
            ? PastOrderState.fromJson(json)
            : PastOrderState.initial(),
      );

  @override
  Map<String, dynamic> toJson(PastOrderState instance) => instance.toJson();
}
