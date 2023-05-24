import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
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
    @JsonKey(ignore: true) @Default(false) bool isLoadingHttpRequest,
    @JsonKey(ignore: true) @Default([]) List<String> postalCodes,
    @JsonKey(ignore: true) @Default('L1') String selectedSearchPostCode,
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
        selectedSearchPostCode: 'L1',
      );

  factory HomePageState.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$HomePageStateFromJson(json),
      );
}

class HomePageStateConverter
    implements JsonConverter<HomePageState, Map<String, dynamic>?> {
  const HomePageStateConverter();

  @override
  HomePageState fromJson(Map<String, dynamic>? json) => tryCatchRethrowInline(
        () => json != null
            ? HomePageState.fromJson(json)
            : HomePageState.initial(),
      );

  @override
  Map<String, dynamic> toJson(HomePageState instance) => instance.toJson();
}
