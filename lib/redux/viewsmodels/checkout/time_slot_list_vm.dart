import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart' as cartActions;

class TimeSlotListViewModel extends Equatable {
  const TimeSlotListViewModel({
    required this.timeSlots,
    required this.updateSelectedTimeSlot,
    required this.getFullfillmentMethods,
  });

  factory TimeSlotListViewModel.fromStore(Store<AppState> store) {
    return TimeSlotListViewModel(
      timeSlots: store.state.cartState.isDelivery
          ? store.state.cartState.deliverySlots
          : store.state.cartState.collectionSlots,
      updateSelectedTimeSlot: (Map<String, String> selectedTimeSlot) {
        store.dispatch(cartActions.UpdateSelectedTimeSlot(selectedTimeSlot));
        store.state.cartState.isDelivery
            ? store.dispatch(
                cartActions.SetDeliveryCharge(
                  store.state.cartState.deliveryCharge,
                ),
              )
            : store.dispatch(
                cartActions.SetDeliveryCharge(
                  store.state.cartState.collectionCharge,
                ),
              );
        store.dispatch(cartActions.computeCartTotals());
      },
      getFullfillmentMethods: (newDate) =>
          store.dispatch(cartActions.getFullfillmentMethods(newDate: newDate)),
    );
  }

  final List<Map<String, String>> timeSlots;
  final void Function(Map<String, String> selectedTimeSlot)
      updateSelectedTimeSlot;
  final void Function(DateTime newDate) getFullfillmentMethods;

  @override
  List<Object?> get props => [timeSlots];
}
