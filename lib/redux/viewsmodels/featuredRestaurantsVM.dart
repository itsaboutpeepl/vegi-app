import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

class FeaturedRestaurantsVM extends Equatable {
  const FeaturedRestaurantsVM({
    required this.isLoadingHomePage,
    required this.featuredRestaurants,
    required this.filterRestaurantsQuery,
    required this.filteredRestaurants,
    required this.filterMenuQuery,
    required this.filteredMenuItems,
    required this.avatarUrl,
    required this.changeOutCode,
    required this.postalCodes,
    required this.isDelivery,
    required this.setIsDelivery,
    required this.globalSearchIsVisible,
    required this.showGlobalSearchBarField,
    required this.listOfScheduledOrders,
  });

  factory FeaturedRestaurantsVM.fromStore(Store<AppState> store) {
    return FeaturedRestaurantsVM(
      isLoadingHomePage: store.state.homePageState.isLoadingHomePage,
      featuredRestaurants: store.state.homePageState.featuredRestaurants,
      filterRestaurantsQuery: store.state.homePageState.filterRestaurantsQuery,
      filteredRestaurants: store.state.homePageState.filteredRestaurants,
      filterMenuQuery: store.state.homePageState.filterMenuQuery,
      filteredMenuItems: store.state.homePageState.filteredMenuItems,
      globalSearchIsVisible: store.state.homePageState.showGlobalSearchBarField,
      avatarUrl: store.state.userState.avatarUrl,
      isDelivery: store.state.cartState.isDelivery,
      postalCodes: store.state.homePageState.postalCodes,
      listOfScheduledOrders: store.state.pastOrderState.listOfScheduledOrders,
      changeOutCode: (outCode) {
        store.dispatch(fetchFeaturedRestaurants(outCode: outCode));
      },
      setIsDelivery: (isDelivery) {
        store
          ..dispatch(SetIsDelivery(isDelivery: isDelivery))
          ..dispatch(computeCartTotals());
      },
      showGlobalSearchBarField: ({required bool makeVisible}) {
        store.dispatch(
          ShowGlobalSearchBarField(
            makeGlobalSearchVisible: makeVisible,
          ),
        );
      },
    );
  }
  final bool isLoadingHomePage;
  final List<RestaurantItem> featuredRestaurants;
  final String filterRestaurantsQuery;
  final List<RestaurantItem> filteredRestaurants;
  final String filterMenuQuery;
  final List<RestaurantMenuItem> filteredMenuItems;
  final bool globalSearchIsVisible;
  final void Function(String outCode) changeOutCode;
  final String avatarUrl;
  final List<String> postalCodes;
  final bool isDelivery;
  final void Function(bool isDelivery) setIsDelivery;
  final void Function({required bool makeVisible}) showGlobalSearchBarField;
  final List<OrderDetails> listOfScheduledOrders;

  @override
  List<Object> get props => [
        featuredRestaurants,
        listOfScheduledOrders,
        isLoadingHomePage,
        postalCodes,
        isDelivery,
        globalSearchIsVisible,
        filterRestaurantsQuery,
        filterMenuQuery,
      ];
}
