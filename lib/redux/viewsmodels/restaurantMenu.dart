import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

class RestaurantMenuViewModel extends Equatable {
  const RestaurantMenuViewModel({
    required this.menuSearchIsVisible,
  });

  factory RestaurantMenuViewModel.fromStore(Store<AppState> store) {
    return RestaurantMenuViewModel(
      menuSearchIsVisible: store.state.homePageState.showMenuSearchBarField,
    );
  }

  final bool menuSearchIsVisible;

  @override
  List<Object> get props => [
        menuSearchIsVisible,
      ];
}
