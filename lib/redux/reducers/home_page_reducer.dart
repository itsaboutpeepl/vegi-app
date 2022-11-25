import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/home_page_state.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';

final homePageReducers = combineReducers<HomePageState>(
  [
    TypedReducer<HomePageState, UpdateFeaturedRestaurants>(
      _getFeaturedRestaurants,
    ),
    TypedReducer<HomePageState, SetIsLoadingHomePage>(_setIsLoadingHomePage),
    TypedReducer<HomePageState, UpdatePostalCodes>(_updatePostalCodes),
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
