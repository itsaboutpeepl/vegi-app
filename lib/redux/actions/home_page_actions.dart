import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class UpdateRestaurantCategories {
  UpdateRestaurantCategories({required this.listOfRestaurantCategories});
  final List<RestaurantCategory> listOfRestaurantCategories;

  @override
  String toString() {
    return 'UpdateRestaurantCategories : $listOfRestaurantCategories';
  }
}

class UpdateFeaturedRestaurants {
  UpdateFeaturedRestaurants({required this.listOfFeaturedRestaurants});
  final List<RestaurantItem> listOfFeaturedRestaurants;

  @override
  String toString() {
    return 'UpdateFeaturedRestaurants : $listOfFeaturedRestaurants';
  }
}

class SetIsLoadingHomePage {
  SetIsLoadingHomePage({required this.isLoading});
  final bool isLoading;

  @override
  String toString() {
    return 'SetIsLoadingHomePage : $isLoading';
  }
}

class ShowGlobalSearchBarField {
  ShowGlobalSearchBarField({required this.makeGlobalSearchVisible});
  final bool makeGlobalSearchVisible;

  @override
  String toString() {
    return 'ShowSearchGlobalBarField: makeVisible: $makeGlobalSearchVisible';
  }
}

// class SetGlobalSearchQuery {
//   SetGlobalSearchQuery({
//     required this.searchQuery,
//   });
//   final String searchQuery;

//   @override
//   String toString() {
//     return 'SetGlobalSearchQuery: searchQuery: $searchQuery';
//   }
// }

class SetGlobalSearchQuerySuccess {
  SetGlobalSearchQuerySuccess({
    required this.searchQuery,
    required this.filteredRestaurants,
  });
  final String searchQuery;
  final List<RestaurantItem> filteredRestaurants;

  @override
  String toString() {
    return 'SetGlobalSearchQuerySuccess: searchQuery: $searchQuery, filteredRestaurants[${filteredRestaurants.length}]';
  }
}

class ShowRestaurantMenuSearchBarField {
  ShowRestaurantMenuSearchBarField({required this.makeMenuSearchVisible});
  final bool makeMenuSearchVisible;

  @override
  String toString() {
    return 'ShowRestaurantMenuSearchBarField : makeMenuSearchVisible: $makeMenuSearchVisible';
  }
}

// class SetMenuSearchQuery {
//   SetMenuSearchQuery({
//     required this.searchQuery,
//   });
//   final String searchQuery;

//   @override
//   String toString() {
//     return 'SetMenuSearchQuery: searchQuery: $searchQuery';
//   }
// }
class SetMenuSearchQuerySuccess {
  SetMenuSearchQuerySuccess({
    required this.searchQuery,
    required this.filteredMenuItems,
  });
  final String searchQuery;
  final List<RestaurantMenuItem> filteredMenuItems;

  @override
  String toString() {
    return 'SetMenuSearchQuerySuccess: searchQuery: $searchQuery, filteredMenuItems[${filteredMenuItems.length}]';
  }
}

class SetSelectedVendor {
  SetSelectedVendor({
    required this.vendor,
  });
  final RestaurantItem vendor;

  @override
  String toString() {
    return 'SetMenuSearchQuerySuccess: vendor: ${vendor.name}';
  }
}

class UpdatePostalCodes {
  UpdatePostalCodes(this.postalCodes);
  final List<String> postalCodes;

  @override
  String toString() {
    return 'UpdatePostalCodes : $postalCodes';
  }
}

ThunkAction<AppState> fetchFeaturedRestaurants({String outCode = 'L1'}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetIsLoadingHomePage(isLoading: true));
      final List<RestaurantItem> restaurants =
          await peeplEatsService.featuredRestaurants(outCode);

      store
        ..dispatch(
          UpdateFeaturedRestaurants(listOfFeaturedRestaurants: restaurants),
        )
        ..dispatch(fetchMenuItemsForRestaurant());
    } catch (e, s) {
      log.error('ERROR - fetchFeaturedRestaurants $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchFeaturedRestaurants $e',
      );
    }
  };
}

ThunkAction<AppState> fetchMenuItemsForRestaurant() {
  return (Store<AppState> store) async {
    try {
      final List<RestaurantItem> currentList =
          store.state.homePageState.featuredRestaurants;

      await Future.forEach(
        currentList,
        (RestaurantItem element) async {
          element.productCategories.addAll(
            await peeplEatsService
                .getProductCategoriesForVendor(int.parse(element.restaurantID)),
          );
          element.listOfMenuItems.addAll(
            await peeplEatsService.getRestaurantMenuItems(element.restaurantID),
          );
        },
      );

      store
        ..dispatch(
          UpdateFeaturedRestaurants(listOfFeaturedRestaurants: currentList),
        )
        ..dispatch(SetIsLoadingHomePage(isLoading: false));
    } catch (e, s) {
      log.error('ERROR - fetchMenuItemsForRestaurant $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchMenuItemsForRestaurant $e',
      );
    }
  };
}

ThunkAction<AppState> setGlobalSearchQuery(
    {required String globalSearchQuery, required String outCode}) {
  return (Store<AppState> store) async {
    try {
      final featuredRestaurants = store.state.homePageState.featuredRestaurants;
      if (globalSearchQuery.isEmpty) {
        store.dispatch(
          SetGlobalSearchQuerySuccess(
            searchQuery: '',
            filteredRestaurants: featuredRestaurants,
          ),
        );
        return;
      }
      final matchingNamedRestaurants = featuredRestaurants.where(
        (element) {
          return element.name
                  .toLowerCase()
                  .contains(globalSearchQuery.toLowerCase()) ||
              element.category
                  .toLowerCase()
                  .contains(globalSearchQuery.toLowerCase());
        },
      ).toList();

      store.dispatch(
        SetGlobalSearchQuerySuccess(
          searchQuery: globalSearchQuery,
          filteredRestaurants: matchingNamedRestaurants,
        ),
      );

      //TODO: Implement
      // final List<RestaurantItem> filteredRestaurants =
      //     await peeplEatsService.getFilteredRestaurants(
      //   outCode: outCode,
      //   globalSearchQuery: globalSearchQuery,
      // );

      // store.dispatch(
      //   SetGlobalSearchQuerySuccess(
      //     searchQuery: globalSearchQuery,
      //     filteredRestaurants: filteredRestaurants,
      //   ),
      // );
    } catch (e, s) {
      log.error('ERROR - setGlobalSearchQuery $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setGlobalSearchQuery $e',
      );
    }
  };
}

ThunkAction<AppState> setSelectedVendor({required RestaurantItem vendor}) {
  return (Store<AppState> store) async {
    store.dispatch(SetSelectedVendor(vendor: vendor));
  };
}

ThunkAction<AppState> setMenuSearchQuery({required String searchQuery}) {
  return (Store<AppState> store) async {
    try {
      final restaurantMenuItems = store.state.homePageState.featuredRestaurants
          .singleWhere(
            (element) =>
                element.restaurantID == store.state.cartState.restaurantID,
          )
          .listOfMenuItems;

      if (searchQuery.isEmpty) {
        store.dispatch(
          SetMenuSearchQuerySuccess(
            searchQuery: '',
            filteredMenuItems: restaurantMenuItems,
          ),
        );
        return;
      }

      final matchingNamedItems = restaurantMenuItems.where(
        (element) {
          return element.name
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              element.categoryName.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ); //TODO: Add the categoryGroup here too from stored state of all categroyGroups to productCategory ID MAP
        },
      ).toList();

      final matchingNamedOptionItems = restaurantMenuItems.where(
        (element) {
          return matchingNamedItems.indexWhere(
                      (already) => element.menuItemID == already.menuItemID) ==
                  -1 &&
              (element.listOfProductOptions.any(
                (productOptionCategory) =>
                    productOptionCategory.name
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()) ||
                    productOptionCategory.listOfOptions.any(
                      (productOption) => productOption.name
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()),
                    ),
              ));
        },
      ).toList();

      store.dispatch(
        SetMenuSearchQuerySuccess(
          searchQuery: searchQuery,
          filteredMenuItems: [
            ...matchingNamedItems,
            ...matchingNamedOptionItems,
          ],
        ),
      );

      //TODO: Add
      // final List<RestaurantMenuItem> filteredCartItems =
      //     await peeplEatsService.getFilteredRestaurantMenu(
      //   restaurantID: store.state.cartState.restaurantID,
      //   searchQuery: searchQuery,
      // );

      // store.dispatch(SetMenuSearchQuerySuccess(
      //   searchQuery: searchQuery,
      //   filteredMenuItems: filteredCartItems,
      // ));
    } catch (e, s) {
      log.error('ERROR - setGlobalSearchQuery $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setGlobalSearchQuery $e',
      );
    }
  };
}

ThunkAction<AppState> fetchPostalCodes() {
  return (Store<AppState> store) async {
    try {
      final List<String> postalCodes = await peeplEatsService.getPostalCodes();

      store.dispatch(UpdatePostalCodes(postalCodes));
    } catch (e, s) {
      log.error('ERROR - fetchPostalCodes $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchPostalCodes $e',
      );
    }
  };
}

ThunkAction<AppState> fetchHomePageData() {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(fetchFeaturedRestaurants())
        ..dispatch(fetchPostalCodes())
        ..dispatch(checkForSavedSeedPhrase());
    } catch (e, s) {
      log.error('ERROR - fetchHomePageData $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchHomePageData $e',
      );
    }
  };
}
