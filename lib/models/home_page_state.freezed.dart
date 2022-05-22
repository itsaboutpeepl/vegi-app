// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageState _$HomePageStateFromJson(Map<String, dynamic> json) {
  return _HomePageState.fromJson(json);
}

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

  _HomePageState call(
      {required List<RestaurantCategory> restaurantCategories,
      required List<RestaurantItem> featuredRestaurants,
      required UserCart currentUserCart,
      required bool isLoadingHomePage,
      required List<String> postalCodes}) {
    return _HomePageState(
      restaurantCategories: restaurantCategories,
      featuredRestaurants: featuredRestaurants,
      currentUserCart: currentUserCart,
      isLoadingHomePage: isLoadingHomePage,
      postalCodes: postalCodes,
    );
  }

  HomePageState fromJson(Map<String, Object?> json) {
    return HomePageState.fromJson(json);
  }
}

/// @nodoc
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {
  List<RestaurantCategory> get restaurantCategories =>
      throw _privateConstructorUsedError;
  List<RestaurantItem> get featuredRestaurants =>
      throw _privateConstructorUsedError;
  UserCart get currentUserCart => throw _privateConstructorUsedError;
  bool get isLoadingHomePage => throw _privateConstructorUsedError;
  List<String> get postalCodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
  $Res call(
      {List<RestaurantCategory> restaurantCategories,
      List<RestaurantItem> featuredRestaurants,
      UserCart currentUserCart,
      bool isLoadingHomePage,
      List<String> postalCodes});

  $UserCartCopyWith<$Res> get currentUserCart;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;

  @override
  $Res call({
    Object? restaurantCategories = freezed,
    Object? featuredRestaurants = freezed,
    Object? currentUserCart = freezed,
    Object? isLoadingHomePage = freezed,
    Object? postalCodes = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantCategories: restaurantCategories == freezed
          ? _value.restaurantCategories
          : restaurantCategories // ignore: cast_nullable_to_non_nullable
              as List<RestaurantCategory>,
      featuredRestaurants: featuredRestaurants == freezed
          ? _value.featuredRestaurants
          : featuredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
      currentUserCart: currentUserCart == freezed
          ? _value.currentUserCart
          : currentUserCart // ignore: cast_nullable_to_non_nullable
              as UserCart,
      isLoadingHomePage: isLoadingHomePage == freezed
          ? _value.isLoadingHomePage
          : isLoadingHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
      postalCodes: postalCodes == freezed
          ? _value.postalCodes
          : postalCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $UserCartCopyWith<$Res> get currentUserCart {
    return $UserCartCopyWith<$Res>(_value.currentUserCart, (value) {
      return _then(_value.copyWith(currentUserCart: value));
    });
  }
}

/// @nodoc
abstract class _$HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(
          _HomePageState value, $Res Function(_HomePageState) then) =
      __$HomePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<RestaurantCategory> restaurantCategories,
      List<RestaurantItem> featuredRestaurants,
      UserCart currentUserCart,
      bool isLoadingHomePage,
      List<String> postalCodes});

  @override
  $UserCartCopyWith<$Res> get currentUserCart;
}

/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(
      _HomePageState _value, $Res Function(_HomePageState) _then)
      : super(_value, (v) => _then(v as _HomePageState));

  @override
  _HomePageState get _value => super._value as _HomePageState;

  @override
  $Res call({
    Object? restaurantCategories = freezed,
    Object? featuredRestaurants = freezed,
    Object? currentUserCart = freezed,
    Object? isLoadingHomePage = freezed,
    Object? postalCodes = freezed,
  }) {
    return _then(_HomePageState(
      restaurantCategories: restaurantCategories == freezed
          ? _value.restaurantCategories
          : restaurantCategories // ignore: cast_nullable_to_non_nullable
              as List<RestaurantCategory>,
      featuredRestaurants: featuredRestaurants == freezed
          ? _value.featuredRestaurants
          : featuredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
      currentUserCart: currentUserCart == freezed
          ? _value.currentUserCart
          : currentUserCart // ignore: cast_nullable_to_non_nullable
              as UserCart,
      isLoadingHomePage: isLoadingHomePage == freezed
          ? _value.isLoadingHomePage
          : isLoadingHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
      postalCodes: postalCodes == freezed
          ? _value.postalCodes
          : postalCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_HomePageState extends _HomePageState {
  _$_HomePageState(
      {required this.restaurantCategories,
      required this.featuredRestaurants,
      required this.currentUserCart,
      required this.isLoadingHomePage,
      required this.postalCodes})
      : super._();

  factory _$_HomePageState.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageStateFromJson(json);

  @override
  final List<RestaurantCategory> restaurantCategories;
  @override
  final List<RestaurantItem> featuredRestaurants;
  @override
  final UserCart currentUserCart;
  @override
  final bool isLoadingHomePage;
  @override
  final List<String> postalCodes;

  @override
  String toString() {
    return 'HomePageState(restaurantCategories: $restaurantCategories, featuredRestaurants: $featuredRestaurants, currentUserCart: $currentUserCart, isLoadingHomePage: $isLoadingHomePage, postalCodes: $postalCodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomePageState &&
            const DeepCollectionEquality()
                .equals(other.restaurantCategories, restaurantCategories) &&
            const DeepCollectionEquality()
                .equals(other.featuredRestaurants, featuredRestaurants) &&
            const DeepCollectionEquality()
                .equals(other.currentUserCart, currentUserCart) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingHomePage, isLoadingHomePage) &&
            const DeepCollectionEquality()
                .equals(other.postalCodes, postalCodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(restaurantCategories),
      const DeepCollectionEquality().hash(featuredRestaurants),
      const DeepCollectionEquality().hash(currentUserCart),
      const DeepCollectionEquality().hash(isLoadingHomePage),
      const DeepCollectionEquality().hash(postalCodes));

  @JsonKey(ignore: true)
  @override
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageStateToJson(this);
  }
}

abstract class _HomePageState extends HomePageState {
  factory _HomePageState(
      {required List<RestaurantCategory> restaurantCategories,
      required List<RestaurantItem> featuredRestaurants,
      required UserCart currentUserCart,
      required bool isLoadingHomePage,
      required List<String> postalCodes}) = _$_HomePageState;
  _HomePageState._() : super._();

  factory _HomePageState.fromJson(Map<String, dynamic> json) =
      _$_HomePageState.fromJson;

  @override
  List<RestaurantCategory> get restaurantCategories;
  @override
  List<RestaurantItem> get featuredRestaurants;
  @override
  UserCart get currentUserCart;
  @override
  bool get isLoadingHomePage;
  @override
  List<String> get postalCodes;
  @override
  @JsonKey(ignore: true)
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
