import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

class FeaturedRestaurantsVM extends Equatable {
  final List<RestaurantItem> featuredRestaurants;

  FeaturedRestaurantsVM({
    required this.featuredRestaurants,
  });

  static FeaturedRestaurantsVM fromStore(Store<AppState> store) {
    return FeaturedRestaurantsVM(
        featuredRestaurants: store.state.homePageState.featuredRestaurants);
  }

  @override
  List<Object> get props => [
        featuredRestaurants,
      ];
}
