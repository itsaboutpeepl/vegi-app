import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

class RestaurantItemViewModel extends Equatable {
  const RestaurantItemViewModel({
    required this.updateRestaurantDetails,
    required this.restaurantID,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.selectedVendor,
    required this.selectVendor,
    required this.menuSearchQuery,
    required this.menuSearchIsVisible,
    required this.userIsSuperAdmin,
    required this.restaurantListOfMenuItems,
    required this.restaurantFilteredListOfMenuItems,
    required this.showMenuSearchBarField,
    required this.filterRestaurantMenu,
    required this.needsCartCheckPopup,
  });

  factory RestaurantItemViewModel.fromStore(Store<AppState> store) {
    return RestaurantItemViewModel(
      needsCartCheckPopup: store.state.cartState.cartItems.isNotEmpty,
      restaurantID: store.state.cartState.restaurantID,
      restaurantName: store.state.cartState.restaurantName,
      restaurantAddress: store.state.cartState.restaurantAddress,
      selectedVendor: store.state.homePageState.featuredRestaurants.any(
              (element) =>
                  element.restaurantID == store.state.cartState.restaurantID)
          ? store.state.homePageState.featuredRestaurants.singleWhere(
              (element) =>
                  element.restaurantID == store.state.cartState.restaurantID,
            )
          : null,
      restaurantListOfMenuItems: store.state.homePageState.featuredRestaurants
              .any((element) =>
                  element.restaurantID == store.state.cartState.restaurantID)
          ? store.state.homePageState.featuredRestaurants
              .singleWhere(
                (element) =>
                    element.restaurantID == store.state.cartState.restaurantID,
              )
              .listOfMenuItems
          : [],
      menuSearchQuery: store.state.homePageState.filterMenuQuery,
      menuSearchIsVisible: store.state.homePageState.showMenuSearchBarField,
      userIsSuperAdmin: store.state.userState.isVegiSuperAdmin,
      restaurantFilteredListOfMenuItems:
          store.state.homePageState.filteredMenuItems,
      showMenuSearchBarField: ({required bool makeVisible}) {
        store.dispatch(
          ShowRestaurantMenuSearchBarField(
            makeMenuSearchVisible: makeVisible,
          ),
        );
      },
      filterRestaurantMenu: ({required String query}) {
        store.dispatch(
          setMenuSearchQuery(
            searchQuery: query,
          ),
        );
      },
      selectVendor: ({required RestaurantItem vendor}) {
        store.dispatch(
          setSelectedVendor(
            vendor: vendor,
          ),
        );
      },
      updateRestaurantDetails: ({
        required RestaurantItem restaurantItem,
        required bool clearCart,
      }) =>
          store.dispatch(
        setRestaurantDetails(
          restaurantItem: restaurantItem,
          clearCart: clearCart,
        ),
      ),
    );
  }

  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses? restaurantAddress;
  final RestaurantItem? selectedVendor;
  final List<RestaurantMenuItem> restaurantListOfMenuItems;
  final List<RestaurantMenuItem> restaurantFilteredListOfMenuItems;
  final bool menuSearchIsVisible;
  final bool userIsSuperAdmin;
  final String menuSearchQuery;
  final void Function({required bool makeVisible}) showMenuSearchBarField;
  final void Function({required String query}) filterRestaurantMenu;
  final void Function({required RestaurantItem vendor}) selectVendor;
  final bool needsCartCheckPopup;
  final void Function({
    required RestaurantItem restaurantItem,
    required bool clearCart,
  }) updateRestaurantDetails;

  List<RestaurantMenuItem> get _restuarantItems {
    return menuSearchQuery.isEmpty
        ? restaurantListOfMenuItems
        : restaurantFilteredListOfMenuItems;
  }

  List<RestaurantMenuItem> get featuredList {
    return _restuarantItems
        .where(
          (element) => element.isFeatured,
        )
        .toList();
  }

  List<RestaurantMenuItem> get regularList {
    return _restuarantItems
        .where(
          (element) => !element.isFeatured,
        )
        .toList();
  }

  Map<String, Map<String, RestaurantMenuItem>> get groupedList {
    return groupBy(
      regularList,
      (RestaurantMenuItem menuItem) => menuItem.categoryName,
    ).map((category, list) => MapEntry(category,
        Map.fromEntries(list.map((item) => MapEntry(item.menuItemID, item)))));
  }

  Iterable<String> get categories => groupedList.keys
      .sorted(
        (a, b) => a.toLowerCase() == 'general'
            ? 1
            : b.toLowerCase() == 'general'
                ? -1
                : a.compareTo(b),
      )
      .toList();

  @override
  List<Object> get props => [
        restaurantID,
        menuSearchIsVisible,
        selectedVendor?.restaurantID ?? '',
        featuredList.length,
        categories,
        restaurantFilteredListOfMenuItems,
        userIsSuperAdmin,
      ];
}
