import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';

class VeganHomeViewModel extends Equatable {
  final UserCart currentUserCart;

  VeganHomeViewModel({
    required this.currentUserCart,
  });

  static VeganHomeViewModel fromStore(Store<AppState> store) {
    return VeganHomeViewModel(
        currentUserCart: store.state.homePageState.currentUserCart);
  }

  @override
  List<Object> get props => [currentUserCart];
}
