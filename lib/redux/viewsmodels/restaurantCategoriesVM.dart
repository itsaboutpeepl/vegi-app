import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';

class RestaurantCategoriesVM extends Equatable {
  final List<RestaurantCategory> restaurantCategories;

  RestaurantCategoriesVM({
    required this.restaurantCategories,
  });

  static RestaurantCategoriesVM fromStore(Store<AppState> store) {
    return RestaurantCategoriesVM(
        restaurantCategories: store.state.homePageState.restaurantCategories);
  }

  @override
  List<Object> get props => [
        restaurantCategories,
      ];
}
