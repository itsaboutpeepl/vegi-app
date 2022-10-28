import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class TipSelectionViewModel extends Equatable {
  const TipSelectionViewModel({
    required this.selectedUserTip,
    required this.updateUserTip,
  });

  factory TipSelectionViewModel.fromStore(Store<AppState> store) {
    return TipSelectionViewModel(
      selectedUserTip: store.state.cartState.selectedTipAmount,
      updateUserTip: ({required int tipAmount}) {
        store.dispatch(updateCartTip(tipAmount));
      },
    );
  }

  final int selectedUserTip;
  final void Function({required int tipAmount}) updateUserTip;

  @override
  List<Object?> get props => [selectedUserTip];
}
