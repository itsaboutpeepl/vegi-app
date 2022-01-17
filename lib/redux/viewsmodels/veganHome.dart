import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

class UserCartViewModel extends Equatable {
  final UserCart currentUserCart;
  final String avatarUrl;
  final Function(OrderItem itemToAdd) updateUserCart;

  UserCartViewModel({
    required this.currentUserCart,
    required this.avatarUrl,
    required this.updateUserCart,
  });

  static UserCartViewModel fromStore(Store<AppState> store) {
    return UserCartViewModel(
        currentUserCart: store.state.homePageState.currentUserCart,
        avatarUrl: store.state.userState.avatarUrl,
        updateUserCart: (itemToAdd) {
          store.dispatch(updateComputeUserCart(itemToAdd));
        });
  }

  @override
  List<Object> get props => [currentUserCart, avatarUrl];
}
