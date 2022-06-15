import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

part 'home_page_state.freezed.dart';
part 'home_page_state.g.dart';

@Freezed()
class HomePageState with _$HomePageState {
  const HomePageState._();

  @JsonSerializable()
  factory HomePageState({
    @JsonKey(ignore: true) @Default([]) List<RestaurantItem> featuredRestaurants,
    @JsonKey(ignore: true) @Default(false) bool isLoadingHomePage,
    @JsonKey(ignore: true) @Default([]) List<String> postalCodes,
  }) = _HomePageState;

  factory HomePageState.initial() => HomePageState(
        featuredRestaurants: [],
        isLoadingHomePage: false,
        postalCodes: [],
      );

  factory HomePageState.fromJson(dynamic json) => _$HomePageStateFromJson(json);
}

class HomePageStateConverter implements JsonConverter<HomePageState, Map<String, dynamic>?> {
  const HomePageStateConverter();

  @override
  HomePageState fromJson(Map<String, dynamic>? json) =>
      json != null ? HomePageState.fromJson(json) : HomePageState.initial();

  @override
  Map<String, dynamic> toJson(HomePageState instance) => instance.toJson();
}
