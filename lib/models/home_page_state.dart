import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';

part 'home_page_state.freezed.dart';
part 'home_page_state.g.dart';

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  @JsonSerializable()
  factory HomePageState({
    required List<RestaurantCategory> restaurantCategories,
    required List<RestaurantItem> featuredRestaurants,
    required UserCart currentUserCart,
  }) = _HomePageState;

  factory HomePageState.initial() => HomePageState(
        restaurantCategories: [],
        featuredRestaurants: [],
        currentUserCart: UserCart.initial(),
      );

  factory HomePageState.fromJson(dynamic json) => _$HomePageStateFromJson(json);
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
