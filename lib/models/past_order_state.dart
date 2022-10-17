import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

part 'past_order_state.freezed.dart';
part 'past_order_state.g.dart';

@Freezed()
class PastOrderState with _$PastOrderState {
  @JsonSerializable()
  factory PastOrderState({
    @Default([]) List<OrderDetails> listOfScheduledOrders,
    @Default([]) List<OrderDetails> listOfOngoingOrders,
  }) = _PastOrderState;

  const PastOrderState._();

  factory PastOrderState.initial() => PastOrderState(
        listOfScheduledOrders: [],
        listOfOngoingOrders: [],
      );

  factory PastOrderState.fromJson(Map<String, dynamic> json) =>
      _$PastOrderStateFromJson(json);
}

class PastOrderStateConverter
    implements JsonConverter<PastOrderState, Map<String, dynamic>?> {
  const PastOrderStateConverter();

  @override
  PastOrderState fromJson(Map<String, dynamic>? json) =>
      json != null ? PastOrderState.fromJson(json) : PastOrderState.initial();

  @override
  Map<String, dynamic> toJson(PastOrderState instance) => instance.toJson();
}
