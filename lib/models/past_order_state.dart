import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

part 'past_order_state.freezed.dart';
part 'past_order_state.g.dart';

@Freezed()
class PastOrderState with _$PastOrderState {
  const PastOrderState._();

  @JsonSerializable()
  factory PastOrderState({
    @Default([]) List<OrderDetails> listOfScheduledOrders,
    @Default(null) OrderDetails? ongoingOrderDetails,
  }) = _PastOrderState;

  factory PastOrderState.initial() => PastOrderState(
        listOfScheduledOrders: [],
        ongoingOrderDetails: null,
      );

  factory PastOrderState.fromJson(dynamic json) => _$PastOrderStateFromJson(json);
}

class PastOrderStateConverter implements JsonConverter<PastOrderState, Map<String, dynamic>?> {
  const PastOrderStateConverter();

  @override
  PastOrderState fromJson(Map<String, dynamic>? json) =>
      json != null ? PastOrderState.fromJson(json) : PastOrderState.initial();

  @override
  Map<String, dynamic> toJson(PastOrderState instance) => instance.toJson();
}
