import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/reducers/cart_state_reducers.dart';
import 'package:vegan_liverpool/redux/reducers/cash_wallet_reducer.dart';
import 'package:vegan_liverpool/redux/reducers/home_page_reducer.dart';
import 'package:vegan_liverpool/redux/reducers/menu_item_reducers.dart';
import 'package:vegan_liverpool/redux/reducers/onboarding_reducer.dart';
import 'package:vegan_liverpool/redux/reducers/past_orders_reducer.dart';
import 'package:vegan_liverpool/redux/reducers/user_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    userState: userReducers(state.userState, action),
    cashWalletState: cashWalletReducers(state.cashWalletState, action),
    homePageState: homePageReducers(state.homePageState, action),
    cartState: cartStateReducers(state.cartState, action),
    menuItemState: menuItemReducers(state.menuItemState, action),
    pastOrderState: pastOrdersReducer(state.pastOrderState, action),
    onboardingState: onboardingReducer(state.onboardingState, action),
  );
}
