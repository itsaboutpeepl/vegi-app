import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart' as cartActions;

class InstructionsCardViewModel extends Equatable {
  const InstructionsCardViewModel({
    required this.hasInstructions,
    required this.instructions,
    required this.removeInstructions,
  });

  factory InstructionsCardViewModel.fromStore(Store<AppState> store) {
    return InstructionsCardViewModel(
      hasInstructions: store.state.cartState.deliveryInstructions.isNotEmpty,
      instructions: store.state.cartState.deliveryInstructions,
      removeInstructions: () =>
          store.dispatch(cartActions.removeInstructions()),
    );
  }

  final bool hasInstructions;
  final String instructions;
  final void Function() removeInstructions;

  @override
  List<Object?> get props => [instructions];
}
