// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  @UserStateConverter()
  UserState get userState => throw _privateConstructorUsedError;
  @CashWalletStateConverter()
  CashWalletState get cashWalletState => throw _privateConstructorUsedError;
  @HomePageStateConverter()
  HomePageState get homePageState => throw _privateConstructorUsedError;
  @UserCartStateConverter()
  UserCartState get cartState => throw _privateConstructorUsedError;
  @MenuItemStateConverter()
  MenuItemState get menuItemState => throw _privateConstructorUsedError;
  @PastOrderStateConverter()
  PastOrderState get pastOrderState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {@UserStateConverter() UserState userState,
      @CashWalletStateConverter() CashWalletState cashWalletState,
      @HomePageStateConverter() HomePageState homePageState,
      @UserCartStateConverter() UserCartState cartState,
      @MenuItemStateConverter() MenuItemState menuItemState,
      @PastOrderStateConverter() PastOrderState pastOrderState});

  $UserStateCopyWith<$Res> get userState;
  $CashWalletStateCopyWith<$Res> get cashWalletState;
  $HomePageStateCopyWith<$Res> get homePageState;
  $UserCartStateCopyWith<$Res> get cartState;
  $MenuItemStateCopyWith<$Res> get menuItemState;
  $PastOrderStateCopyWith<$Res> get pastOrderState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
    Object? cashWalletState = null,
    Object? homePageState = null,
    Object? cartState = null,
    Object? menuItemState = null,
    Object? pastOrderState = null,
  }) {
    return _then(_value.copyWith(
      userState: null == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
      cashWalletState: null == cashWalletState
          ? _value.cashWalletState
          : cashWalletState // ignore: cast_nullable_to_non_nullable
              as CashWalletState,
      homePageState: null == homePageState
          ? _value.homePageState
          : homePageState // ignore: cast_nullable_to_non_nullable
              as HomePageState,
      cartState: null == cartState
          ? _value.cartState
          : cartState // ignore: cast_nullable_to_non_nullable
              as UserCartState,
      menuItemState: null == menuItemState
          ? _value.menuItemState
          : menuItemState // ignore: cast_nullable_to_non_nullable
              as MenuItemState,
      pastOrderState: null == pastOrderState
          ? _value.pastOrderState
          : pastOrderState // ignore: cast_nullable_to_non_nullable
              as PastOrderState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res> get userState {
    return $UserStateCopyWith<$Res>(_value.userState, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CashWalletStateCopyWith<$Res> get cashWalletState {
    return $CashWalletStateCopyWith<$Res>(_value.cashWalletState, (value) {
      return _then(_value.copyWith(cashWalletState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HomePageStateCopyWith<$Res> get homePageState {
    return $HomePageStateCopyWith<$Res>(_value.homePageState, (value) {
      return _then(_value.copyWith(homePageState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCartStateCopyWith<$Res> get cartState {
    return $UserCartStateCopyWith<$Res>(_value.cartState, (value) {
      return _then(_value.copyWith(cartState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuItemStateCopyWith<$Res> get menuItemState {
    return $MenuItemStateCopyWith<$Res>(_value.menuItemState, (value) {
      return _then(_value.copyWith(menuItemState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PastOrderStateCopyWith<$Res> get pastOrderState {
    return $PastOrderStateCopyWith<$Res>(_value.pastOrderState, (value) {
      return _then(_value.copyWith(pastOrderState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UserStateConverter() UserState userState,
      @CashWalletStateConverter() CashWalletState cashWalletState,
      @HomePageStateConverter() HomePageState homePageState,
      @UserCartStateConverter() UserCartState cartState,
      @MenuItemStateConverter() MenuItemState menuItemState,
      @PastOrderStateConverter() PastOrderState pastOrderState});

  @override
  $UserStateCopyWith<$Res> get userState;
  @override
  $CashWalletStateCopyWith<$Res> get cashWalletState;
  @override
  $HomePageStateCopyWith<$Res> get homePageState;
  @override
  $UserCartStateCopyWith<$Res> get cartState;
  @override
  $MenuItemStateCopyWith<$Res> get menuItemState;
  @override
  $PastOrderStateCopyWith<$Res> get pastOrderState;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
    Object? cashWalletState = null,
    Object? homePageState = null,
    Object? cartState = null,
    Object? menuItemState = null,
    Object? pastOrderState = null,
  }) {
    return _then(_$_AppState(
      userState: null == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
      cashWalletState: null == cashWalletState
          ? _value.cashWalletState
          : cashWalletState // ignore: cast_nullable_to_non_nullable
              as CashWalletState,
      homePageState: null == homePageState
          ? _value.homePageState
          : homePageState // ignore: cast_nullable_to_non_nullable
              as HomePageState,
      cartState: null == cartState
          ? _value.cartState
          : cartState // ignore: cast_nullable_to_non_nullable
              as UserCartState,
      menuItemState: null == menuItemState
          ? _value.menuItemState
          : menuItemState // ignore: cast_nullable_to_non_nullable
              as MenuItemState,
      pastOrderState: null == pastOrderState
          ? _value.pastOrderState
          : pastOrderState // ignore: cast_nullable_to_non_nullable
              as PastOrderState,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_AppState extends _AppState with DiagnosticableTreeMixin {
  _$_AppState(
      {@UserStateConverter() required this.userState,
      @CashWalletStateConverter() required this.cashWalletState,
      @HomePageStateConverter() required this.homePageState,
      @UserCartStateConverter() required this.cartState,
      @MenuItemStateConverter() required this.menuItemState,
      @PastOrderStateConverter() required this.pastOrderState})
      : super._();

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$$_AppStateFromJson(json);

  @override
  @UserStateConverter()
  final UserState userState;
  @override
  @CashWalletStateConverter()
  final CashWalletState cashWalletState;
  @override
  @HomePageStateConverter()
  final HomePageState homePageState;
  @override
  @UserCartStateConverter()
  final UserCartState cartState;
  @override
  @MenuItemStateConverter()
  final MenuItemState menuItemState;
  @override
  @PastOrderStateConverter()
  final PastOrderState pastOrderState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(userState: $userState, cashWalletState: $cashWalletState, homePageState: $homePageState, cartState: $cartState, menuItemState: $menuItemState, pastOrderState: $pastOrderState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('userState', userState))
      ..add(DiagnosticsProperty('cashWalletState', cashWalletState))
      ..add(DiagnosticsProperty('homePageState', homePageState))
      ..add(DiagnosticsProperty('cartState', cartState))
      ..add(DiagnosticsProperty('menuItemState', menuItemState))
      ..add(DiagnosticsProperty('pastOrderState', pastOrderState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.userState, userState) ||
                other.userState == userState) &&
            (identical(other.cashWalletState, cashWalletState) ||
                other.cashWalletState == cashWalletState) &&
            (identical(other.homePageState, homePageState) ||
                other.homePageState == homePageState) &&
            (identical(other.cartState, cartState) ||
                other.cartState == cartState) &&
            (identical(other.menuItemState, menuItemState) ||
                other.menuItemState == menuItemState) &&
            (identical(other.pastOrderState, pastOrderState) ||
                other.pastOrderState == pastOrderState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userState, cashWalletState,
      homePageState, cartState, menuItemState, pastOrderState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(
      this,
    );
  }
}

abstract class _AppState extends AppState {
  factory _AppState(
      {@UserStateConverter()
          required final UserState userState,
      @CashWalletStateConverter()
          required final CashWalletState cashWalletState,
      @HomePageStateConverter()
          required final HomePageState homePageState,
      @UserCartStateConverter()
          required final UserCartState cartState,
      @MenuItemStateConverter()
          required final MenuItemState menuItemState,
      @PastOrderStateConverter()
          required final PastOrderState pastOrderState}) = _$_AppState;
  _AppState._() : super._();

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  @UserStateConverter()
  UserState get userState;
  @override
  @CashWalletStateConverter()
  CashWalletState get cashWalletState;
  @override
  @HomePageStateConverter()
  HomePageState get homePageState;
  @override
  @UserCartStateConverter()
  UserCartState get cartState;
  @override
  @MenuItemStateConverter()
  MenuItemState get menuItemState;
  @override
  @PastOrderStateConverter()
  PastOrderState get pastOrderState;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
