import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class WaitingListFunnelViewModel extends Equatable {
  const WaitingListFunnelViewModel({
    required this.email,
    required this.surveyQuestions,
    required this.surveyCompleted,
  });

  factory WaitingListFunnelViewModel.fromStore(Store<AppState> store) {
    return WaitingListFunnelViewModel(
      email: store.state.userState.email,
      surveyQuestions: store.state.userState.surveyQuestions,
      surveyCompleted: store.state.userState.surveyCompleted,
    );
  }

  final String email;
  final List<String> surveyQuestions;
  final bool surveyCompleted;

  @override
  List<Object> get props => [
        email,
        surveyQuestions,
        surveyCompleted,
      ];
}
