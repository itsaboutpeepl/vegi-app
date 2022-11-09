import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart' as cartActions;

class TimeSlotListViewModel extends Equatable {
  const TimeSlotListViewModel({
    required this.timeSlots,
    required this.updateSelectedTimeSlot,
    required this.getTimeSlots,
    required this.eligibleOrderDates,
  });

  factory TimeSlotListViewModel.fromStore(Store<AppState> store) {
    return TimeSlotListViewModel(
      eligibleOrderDates: store.state.cartState.eligibleOrderDates,
      timeSlots: store.state.cartState.isDelivery
          ? store.state.cartState.deliverySlots
          : store.state.cartState.collectionSlots,
      updateSelectedTimeSlot: (TimeSlot selectedTimeSlot) {
        store.dispatch(
          cartActions.updateSelectedTimeSlot(
            selectedTimeSlot: selectedTimeSlot,
          ),
        );
      },
      getTimeSlots: (newDate) =>
          store.dispatch(cartActions.getTimeSlots(newDate: newDate)),
    );
  }

  final List<TimeSlot> timeSlots;
  final List<DateTime> eligibleOrderDates;
  final void Function(TimeSlot selectedTimeSlot) updateSelectedTimeSlot;
  final void Function(DateTime newDate) getTimeSlots;

  @override
  List<Object?> get props => [timeSlots, eligibleOrderDates];
}
