import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateRestaurantCategories {
  final List<RestaurantCategory> listOfRestaurantCategories;
  UpdateRestaurantCategories({required this.listOfRestaurantCategories});
}

class UpdateFeaturedRestaurants {
  final List<RestaurantItem> listOfFeaturedRestaurants;
  UpdateFeaturedRestaurants({required this.listOfFeaturedRestaurants});
}

class UpdateUserCart {
  final UserCart currentUserCart;
  UpdateUserCart({required this.currentUserCart});
}

// class UpdateFeaturedPost {
//   final List<BlogArticle> listOfFeaturedArticles;

//   UpdateFeaturedPost({required this.listOfFeaturedArticles});
// }

// class UpdateCategoryList {
//   final List<CategoryArticles> categoryList;

//   UpdateCategoryList({required this.categoryList});
// }

// class UpdateFeaturedVideos {
//   final List<VideoArticle> featuredVideos;

//   UpdateFeaturedVideos({required this.featuredVideos});
// }

// class UpdateEventsList {
//   final List<Events> eventsList;

//   UpdateEventsList({required this.eventsList});
// }

// class UpdateDirectoryList {
//   final List<Directory> directoryList;

//   UpdateDirectoryList({required this.directoryList});
// }

// class UpdatePlayConfetti {
//   final bool playConfetti;
//   UpdatePlayConfetti({required this.playConfetti});
// }

ThunkAction fetchRestaurantCategories() {
  return (Store store) async {
    try {
      List<RestaurantCategory> listOfRestaurantCategories = [
        restaurantCategory1,
        restaurantCategory2
      ];

      store.dispatch(UpdateRestaurantCategories(
          listOfRestaurantCategories: listOfRestaurantCategories));
    } catch (e, s) {
      log.error('ERROR - fetchRestaurantCategories $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchRestaurantCategories $e',
      );
    }
  };
}

ThunkAction fetchFeaturedRestaurants() {
  return (Store store) async {
    try {
      List<RestaurantItem> listOfFeaturedRestaurants = [
        restaurantItem1,
        restaurantItem2,
        restaurantItem3
      ];

      store.dispatch(UpdateFeaturedRestaurants(
          listOfFeaturedRestaurants: listOfFeaturedRestaurants));
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

// ThunkAction fetchFeaturedPosts() {
//   return (Store store) async {
//     try {
//       List<BlogArticle> articles = await newsService.featuredArticles();

//       store.dispatch(UpdateFeaturedPost(listOfFeaturedArticles: articles));
//     } catch (e, s) {
//       log.error('ERROR - fetchFeaturedPost $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchFeaturedPost $e',
//       );
//     }
//   };
// }

// ThunkAction fetchFeaturedVideos() {
//   return (Store store) async {
//     try {
//       List<VideoArticle> videoArticles = await newsService.featuredVideos();
//       store.dispatch(UpdateFeaturedVideos(featuredVideos: videoArticles));
//     } catch (e, s) {
//       log.error('ERROR - fetchFeaturedVideos $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchFeaturedVideos $e',
//       );
//     }
//   };
// }

// ThunkAction fetchEventsList() {
//   return (Store store) async {
//     try {
//       List<Events> eventsList = await newsService.eventsList();
//       store.dispatch(UpdateEventsList(eventsList: eventsList));
//     } catch (e, s) {
//       log.error('ERROR - fetchEventsList $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchEventsList $e',
//       );
//     }
//   };
// }

// ThunkAction fetchDirectoryList() {
//   return (Store store) async {
//     try {
//       List<Directory> directoryList = await newsService.directoryList();
//       store.dispatch(UpdateDirectoryList(directoryList: directoryList));
//     } catch (e, s) {
//       log.error('ERROR - fetchDirectoryList $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchDirectoryList $e',
//       );
//     }
//   };
// }

ThunkAction fetchHomePageData() {
  return (Store store) async {
    try {
      store.dispatch(fetchRestaurantCategories());
      store.dispatch(fetchFeaturedRestaurants());
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
