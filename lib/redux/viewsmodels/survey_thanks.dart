import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class SurveyThanksViewModel extends Equatable {
  const SurveyThanksViewModel({
    required this.email,
  });

  factory SurveyThanksViewModel.fromStore(Store<AppState> store) {
    return SurveyThanksViewModel(
      email: store.state.userState.email,
    );
  }

  final String email;

  @override
  List<Object> get props => [email];
}
