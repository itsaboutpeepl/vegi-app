import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

class FeaturedRestaurantsVM extends Equatable {
  final List<RestaurantItem> featuredRestaurants;
  final bool isLoadingHomePage;
  final Function(String outCode) changeOutCode;
  final String avatarUrl;

  FeaturedRestaurantsVM({
    required this.featuredRestaurants,
    required this.isLoadingHomePage,
    required this.avatarUrl,
    required this.changeOutCode,
  });

  static FeaturedRestaurantsVM fromStore(Store<AppState> store) {
    return FeaturedRestaurantsVM(
      featuredRestaurants: store.state.homePageState.featuredRestaurants,
      isLoadingHomePage: store.state.homePageState.isLoadingHomePage,
      avatarUrl: store.state.userState.avatarUrl,
      changeOutCode: (outCode) {
        store.dispatch(fetchFeaturedRestaurants(outCode: outCode));
      },
    );
  }

  @override
  List<Object> get props => [
        featuredRestaurants,
        isLoadingHomePage,
      ];
}
