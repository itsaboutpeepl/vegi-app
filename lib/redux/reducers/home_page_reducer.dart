import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/home_page_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

final homePageReducers = combineReducers<HomePageState>(
  [
    TypedReducer<HomePageState, UpdateFeaturedRestaurants>(
      _getFeaturedRestaurants,
    ),
    TypedReducer<HomePageState, UpdateRestaurant>(
      _updateRestaurant,
    ),
    TypedReducer<HomePageState, SetIsLoadingHomePage>(_setIsLoadingHomePage),
    TypedReducer<HomePageState, UpdatePostalCodes>(_updatePostalCodes),
    TypedReducer<HomePageState, UpdateSelectedSearchPostCode>(
        _updateSelectedSearchPostCode),
    TypedReducer<HomePageState, ShowGlobalSearchBarField>(
      _showGlobalSearchBarField,
    ),
    TypedReducer<HomePageState, SetGlobalSearchQuerySuccess>(
        _setGlobalSearchQuery),
    TypedReducer<HomePageState, SetMenuSearchQuerySuccess>(_setMenuSearchQuery),
    TypedReducer<HomePageState, ShowRestaurantMenuSearchBarField>(
      _showMenuSearchBarField,
    ),
  ],
);

HomePageState _getFeaturedRestaurants(
  HomePageState state,
  UpdateFeaturedRestaurants action,
) {
  return state.copyWith(featuredRestaurants: action.listOfFeaturedRestaurants);
}

HomePageState _updateRestaurant(
  HomePageState state,
  UpdateRestaurant action,
) {
  return state.copyWith(
    featuredRestaurants: state.featuredRestaurants
        .where(
          (element) => element.restaurantID != action.restaurant.restaurantID,
        )
        .toList()
      ..add(action.restaurant),
  );
}

HomePageState _showGlobalSearchBarField(
  HomePageState state,
  ShowGlobalSearchBarField action,
) {
  return state.copyWith(
    showGlobalSearchBarField: action.makeGlobalSearchVisible,
  );
}

HomePageState _setGlobalSearchQuery(
  HomePageState state,
  SetGlobalSearchQuerySuccess action,
) {
  return state.copyWith(
    filteredRestaurants: action.filteredRestaurants,
    filterRestaurantsQuery: action.searchQuery,
  );
}

HomePageState _showMenuSearchBarField(
  HomePageState state,
  ShowRestaurantMenuSearchBarField action,
) {
  return state.copyWith(
    showMenuSearchBarField: action.makeMenuSearchVisible,
  );
}

HomePageState _setMenuSearchQuery(
  HomePageState state,
  SetMenuSearchQuerySuccess action,
) {
  return state.copyWith(
    filteredMenuItems: action.filteredMenuItems,
    filterMenuQuery: action.searchQuery,
  );
}

HomePageState _setIsLoadingHomePage(
  HomePageState state,
  SetIsLoadingHomePage action,
) {
  return state.copyWith(isLoadingHomePage: action.isLoading);
}

HomePageState _updatePostalCodes(
  HomePageState state,
  UpdatePostalCodes action,
) {
  return state.copyWith(postalCodes: action.postalCodes);
}

HomePageState _updateSelectedSearchPostCode(
  HomePageState state,
  UpdateSelectedSearchPostCode action,
) {
  if (!state.postalCodes.contains(action.selectedSearchPostCode)) {
    return state.copyWith(
      postalCodes: state.postalCodes..add(action.selectedSearchPostCode),
      selectedSearchPostCode: action.selectedSearchPostCode,
    );
  }
  return state.copyWith(selectedSearchPostCode: action.selectedSearchPostCode);
}
