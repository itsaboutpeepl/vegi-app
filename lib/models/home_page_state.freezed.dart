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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageState _$HomePageStateFromJson(Map<String, dynamic> json) {
  return _HomePageState.fromJson(json);
}

/// @nodoc
mixin _$HomePageState {
  @JsonKey(ignore: true)
  List<RestaurantItem> get featuredRestaurants =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isLoadingHomePage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<RestaurantItem> featuredRestaurants,
      @JsonKey(ignore: true) bool isLoadingHomePage,
      @JsonKey(ignore: true) List<String> postalCodes});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredRestaurants = null,
    Object? isLoadingHomePage = null,
    Object? postalCodes = null,
  }) {
    return _then(_value.copyWith(
      featuredRestaurants: null == featuredRestaurants
          ? _value.featuredRestaurants
          : featuredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
      isLoadingHomePage: null == isLoadingHomePage
          ? _value.isLoadingHomePage
          : isLoadingHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
      postalCodes: null == postalCodes
          ? _value.postalCodes
          : postalCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<RestaurantItem> featuredRestaurants,
      @JsonKey(ignore: true) bool isLoadingHomePage,
      @JsonKey(ignore: true) List<String> postalCodes});
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HomePageState>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredRestaurants = null,
    Object? isLoadingHomePage = null,
    Object? postalCodes = null,
  }) {
    return _then(_$_HomePageState(
      featuredRestaurants: null == featuredRestaurants
          ? _value.featuredRestaurants
          : featuredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
      isLoadingHomePage: null == isLoadingHomePage
          ? _value.isLoadingHomePage
          : isLoadingHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
      postalCodes: null == postalCodes
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
      {@JsonKey(ignore: true) this.featuredRestaurants = const [],
      @JsonKey(ignore: true) this.isLoadingHomePage = false,
      @JsonKey(ignore: true) this.postalCodes = const []})
      : super._();

  factory _$_HomePageState.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final List<RestaurantItem> featuredRestaurants;
  @override
  @JsonKey(ignore: true)
  final bool isLoadingHomePage;
  @override
  @JsonKey(ignore: true)
  final List<String> postalCodes;

  @override
  String toString() {
    return 'HomePageState(featuredRestaurants: $featuredRestaurants, isLoadingHomePage: $isLoadingHomePage, postalCodes: $postalCodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            const DeepCollectionEquality()
                .equals(other.featuredRestaurants, featuredRestaurants) &&
            (identical(other.isLoadingHomePage, isLoadingHomePage) ||
                other.isLoadingHomePage == isLoadingHomePage) &&
            const DeepCollectionEquality()
                .equals(other.postalCodes, postalCodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(featuredRestaurants),
      isLoadingHomePage,
      const DeepCollectionEquality().hash(postalCodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageStateToJson(
      this,
    );
  }
}

abstract class _HomePageState extends HomePageState {
  factory _HomePageState(
      {@JsonKey(ignore: true)
          final List<RestaurantItem> featuredRestaurants,
      @JsonKey(ignore: true)
          final bool isLoadingHomePage,
      @JsonKey(ignore: true)
          final List<String> postalCodes}) = _$_HomePageState;
  _HomePageState._() : super._();

  factory _HomePageState.fromJson(Map<String, dynamic> json) =
      _$_HomePageState.fromJson;

  @override
  @JsonKey(ignore: true)
  List<RestaurantItem> get featuredRestaurants;
  @override
  @JsonKey(ignore: true)
  bool get isLoadingHomePage;
  @override
  @JsonKey(ignore: true)
  List<String> get postalCodes;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
