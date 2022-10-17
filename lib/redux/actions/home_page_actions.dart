import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
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

class UpdatePostalCodes {
  UpdatePostalCodes(this.postalCodes);
  final List<String> postalCodes;

  @override
  String toString() {
    return 'UpdatePostalCodes : $postalCodes';
  }
}

// ThunkAction<AppState> fetchRestaurantCategories() {
//   return (Store<AppState> store) async {
//     try {
//       List<RestaurantCategory> listOfRestaurantCategories = [
//         restaurantCategory2,
//         restaurantCategory1,
//       ];

//       store.dispatch(UpdateRestaurantCategories(listOfRestaurantCategories: listOfRestaurantCategories));
//     } catch (e, s) {
//       log.error('ERROR - fetchRestaurantCategories $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchRestaurantCategories $e',
//       );
//     }
//   };
// }

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
        ..dispatch(fetchMenuItemsForRestaurant())
        ..dispatch(SetIsLoadingHomePage(isLoading: false));
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
          element.listOfMenuItems.addAll(
            await peeplEatsService.getRestaurantMenuItems(element.restaurantID),
          );
        },
      );

      store.dispatch(
        UpdateFeaturedRestaurants(listOfFeaturedRestaurants: currentList),
      );
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
      //store.dispatch(fetchRestaurantCategories());
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
