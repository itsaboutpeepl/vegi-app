import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class DeliveryCardViewModel extends Equatable {
  const DeliveryCardViewModel({
    required this.hasTimeSlot,
    required this.isDelivery,
    required this.selectedTimeSlot,
  });

  factory DeliveryCardViewModel.fromStore(Store<AppState> store) {
    final hasTimeSlot = store.state.cartState.selectedTimeSlot != null;

    return DeliveryCardViewModel(
      hasTimeSlot: hasTimeSlot,
      isDelivery: store.state.cartState.isDelivery,
      selectedTimeSlot: hasTimeSlot
          ? store.state.cartState.selectedTimeSlot!.formattedDate
          : 'Please select a time slot',
    );
  }

  final bool hasTimeSlot;
  final bool isDelivery;
  final String selectedTimeSlot;

  @override
  List<Object?> get props => [selectedTimeSlot, isDelivery];
}
