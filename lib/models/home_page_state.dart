import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'home_page_state.freezed.dart';
part 'home_page_state.g.dart';

@Freezed()
class HomePageState with _$HomePageState {
  @JsonSerializable()
  factory HomePageState({
    @JsonKey(ignore: true)
    @Default([])
        List<RestaurantItem> featuredRestaurants,
    @Default([]) List<RestaurantItem> filteredRestaurants,
    @Default('') String filterRestaurantsQuery,
    @JsonKey(ignore: true) @Default(false) bool showGlobalSearchBarField,
    @Default([]) List<RestaurantMenuItem> filteredMenuItems,
    @Default('') String filterMenuQuery,
    @JsonKey(ignore: true) @Default(false) bool showMenuSearchBarField,
    @JsonKey(ignore: true) @Default(false) bool isLoadingHomePage,
    @JsonKey(ignore: true) @Default([]) List<String> postalCodes,
  }) = _HomePageState;

  const HomePageState._();

  factory HomePageState.initial() => HomePageState(
        featuredRestaurants: [],
        filteredRestaurants: [],
        filterRestaurantsQuery: '',
        showGlobalSearchBarField: false,
        filteredMenuItems: [],
        filterMenuQuery: '',
        showMenuSearchBarField: false,
        isLoadingHomePage: false,
        postalCodes: [],
      );

  factory HomePageState.fromJson(Map<String, dynamic> json) =>
      _$HomePageStateFromJson(json);
}

class HomePageStateConverter
    implements JsonConverter<HomePageState, Map<String, dynamic>?> {
  const HomePageStateConverter();

  @override
  HomePageState fromJson(Map<String, dynamic>? json) =>
      json != null ? HomePageState.fromJson(json) : HomePageState.initial();

  @override
  Map<String, dynamic> toJson(HomePageState instance) => instance.toJson();
}
