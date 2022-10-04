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
  @JsonKey(ignore: true)
  String get selectedPostalCode => throw _privateConstructorUsedError;

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
      {@JsonKey(ignore: true) List<RestaurantItem> featuredRestaurants,
      @JsonKey(ignore: true) bool isLoadingHomePage,
      @JsonKey(ignore: true) List<String> postalCodes,
      @JsonKey(ignore: true) String selectedPostalCode});
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
    Object? featuredRestaurants = freezed,
    Object? isLoadingHomePage = freezed,
    Object? postalCodes = freezed,
    Object? selectedPostalCode = freezed,
  }) {
    return _then(_value.copyWith(
      featuredRestaurants: featuredRestaurants == freezed
          ? _value.featuredRestaurants
          : featuredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
      isLoadingHomePage: isLoadingHomePage == freezed
          ? _value.isLoadingHomePage
          : isLoadingHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
      postalCodes: postalCodes == freezed
          ? _value.postalCodes
          : postalCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedPostalCode: selectedPostalCode == freezed
          ? _value.selectedPostalCode
          : selectedPostalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) List<RestaurantItem> featuredRestaurants,
      @JsonKey(ignore: true) bool isLoadingHomePage,
      @JsonKey(ignore: true) List<String> postalCodes,
      @JsonKey(ignore: true) String selectedPostalCode});
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, (v) => _then(v as _$_HomePageState));

  @override
  _$_HomePageState get _value => super._value as _$_HomePageState;

  @override
  $Res call({
    Object? featuredRestaurants = freezed,
    Object? isLoadingHomePage = freezed,
    Object? postalCodes = freezed,
    Object? selectedPostalCode = freezed,
  }) {
    return _then(_$_HomePageState(
      featuredRestaurants: featuredRestaurants == freezed
          ? _value.featuredRestaurants
          : featuredRestaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantItem>,
      isLoadingHomePage: isLoadingHomePage == freezed
          ? _value.isLoadingHomePage
          : isLoadingHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
      postalCodes: postalCodes == freezed
          ? _value.postalCodes
          : postalCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedPostalCode: selectedPostalCode == freezed
          ? _value.selectedPostalCode
          : selectedPostalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_HomePageState extends _HomePageState {
  _$_HomePageState(
      {@JsonKey(ignore: true) this.featuredRestaurants = const [],
      @JsonKey(ignore: true) this.isLoadingHomePage = false,
      @JsonKey(ignore: true) this.postalCodes = const [],
      @JsonKey(ignore: true) this.selectedPostalCode = ''})
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
  @JsonKey(ignore: true)
  final String selectedPostalCode;

  @override
  String toString() {
    return 'HomePageState(featuredRestaurants: $featuredRestaurants, isLoadingHomePage: $isLoadingHomePage, postalCodes: $postalCodes, selectedPostalCode: $selectedPostalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            const DeepCollectionEquality()
                .equals(other.featuredRestaurants, featuredRestaurants) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingHomePage, isLoadingHomePage) &&
            const DeepCollectionEquality()
                .equals(other.postalCodes, postalCodes) &&
            const DeepCollectionEquality()
                .equals(other.selectedPostalCode, selectedPostalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(featuredRestaurants),
      const DeepCollectionEquality().hash(isLoadingHomePage),
      const DeepCollectionEquality().hash(postalCodes),
      const DeepCollectionEquality().hash(selectedPostalCode));

  @JsonKey(ignore: true)
  @override
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageStateToJson(this);
  }
}

abstract class _HomePageState extends HomePageState {
  factory _HomePageState(
      {@JsonKey(ignore: true)
          final List<RestaurantItem> featuredRestaurants,
      @JsonKey(ignore: true)
          final bool isLoadingHomePage,
      @JsonKey(ignore: true)
          final List<String> postalCodes,
      @JsonKey(ignore: true)
          final String selectedPostalCode}) = _$_HomePageState;
  _HomePageState._() : super._();

  factory _HomePageState.fromJson(Map<String, dynamic> json) =
      _$_HomePageState.fromJson;

  @override
  @JsonKey(ignore: true)
  List<RestaurantItem> get featuredRestaurants =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isLoadingHomePage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<String> get postalCodes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get selectedPostalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
