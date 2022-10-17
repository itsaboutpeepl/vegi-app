import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/models/home_page_state.dart';
import 'package:vegan_liverpool/models/menu_item_state.dart';
import 'package:vegan_liverpool/models/past_order_state.dart';
import 'package:vegan_liverpool/models/user_cart_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@immutable
@Freezed()
class AppState with _$AppState {
  @JsonSerializable()
  factory AppState({
    @UserStateConverter() required UserState userState,
    @CashWalletStateConverter() required CashWalletState cashWalletState,
    @HomePageStateConverter() required HomePageState homePageState,
    @UserCartStateConverter() required UserCartState cartState,
    @MenuItemStateConverter() required MenuItemState menuItemState,
    @PastOrderStateConverter() required PastOrderState pastOrderState,
  }) = _AppState;

  const AppState._();

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      cashWalletState: CashWalletState.initial(),
      homePageState: HomePageState.initial(),
      cartState: UserCartState.initial(),
      menuItemState: MenuItemState.initial(),
      pastOrderState: PastOrderState.initial(),
    );
  }

  factory AppState.fromJson(dynamic json) =>
      _$AppStateFromJson(json as Map<String, dynamic>);
}
