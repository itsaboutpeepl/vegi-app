// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:auto_route/empty_router_widgets.dart' as _i11;
import 'package:flutter/foundation.dart' as _i31;
import 'package:flutter/material.dart' as _i29;
import 'package:redux_dev_tools/redux_dev_tools.dart' as _i32;

import '../../features/account/screens/profile.dart' as _i15;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i4;
import '../../features/onboard/screens/security_screen.dart' as _i2;
import '../../features/onboard/screens/show_user_mnemonic.dart' as _i22;
import '../../features/onboard/screens/signup_screen.dart' as _i6;
import '../../features/onboard/screens/username_screen.dart' as _i8;
import '../../features/onboard/screens/verify_screen.dart' as _i7;
import '../../features/onboard/screens/verify_user_mnemonic.dart' as _i23;
import '../../features/pay/screens/generate_QR_from_cart.dart' as _i25;
import '../../features/pay/screens/scan_payment_recipient_qr.dart' as _i26;
import '../../features/screens/main_screen.dart' as _i10;
import '../../features/screens/on_board_screen.dart' as _i5;
import '../../features/screens/pincode_screen.dart' as _i3;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/topup/screens/topup.dart' as _i16;
import '../../features/topup/screens/topup_explained.dart' as _i27;
import '../../features/veganHome/screens/aboutScreen.dart' as _i20;
import '../../features/veganHome/screens/allOrdersPage.dart' as _i17;
import '../../features/veganHome/screens/checkout_screen_2.dart' as _i24;
import '../../features/veganHome/screens/faqScreen.dart' as _i19;
import '../../features/veganHome/screens/orderConfirmed.dart' as _i14;
import '../../features/veganHome/screens/preparingOrderScreen.dart' as _i21;
import '../../features/veganHome/screens/restaurantMenuScreen.dart' as _i13;
import '../../features/veganHome/screens/scheduledOrdersPage.dart' as _i18;
import '../../features/veganHome/screens/veganHome.dart' as _i12;
import '../../features/veganHome/widgets/shared/redux_state_viewer.dart' as _i9;
import '../../models/app_state.dart' as _i33;
import '../../models/restaurant/orderDetails.dart' as _i35;
import '../../models/restaurant/restaurantMenuItem.dart' as _i34;
import 'route_guards.dart' as _i30;

class RootRouter extends _i28.RootStackRouter {
  RootRouter({
    _i29.GlobalKey<_i29.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i30.AuthGuard authGuard;

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SplashScreen(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    ChooseSecurityOption.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseSecurityOption(),
      );
    },
    PinCodeScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PinCodeScreen(),
      );
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.RestoreFromBackupScreen(),
      );
    },
    OnBoardScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.VerifyPhoneNumber(
          key: args.key,
          verificationId: args.verificationId,
        ),
      );
    },
    UserNameScreen.name: (routeData) {
      final args = routeData.argsAs<UserNameScreenArgs>(
          orElse: () => const UserNameScreenArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.UserNameScreen(key: args.key),
      );
    },
    ReduxStateViewer.name: (routeData) {
      final args = routeData.argsAs<ReduxStateViewerArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ReduxStateViewer(
          args.store,
          key: args.key,
          actionMaxLines: args.actionMaxLines,
          stateMaxLines: args.stateMaxLines,
        ),
      );
    },
    MainScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MainScreen(),
      );
    },
    VeganHomeAltTab.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    TopupTab.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    AccountTab.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.EmptyRouterPage(),
      );
    },
    VeganHomeScreenAlt.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.VeganHomeScreen(),
      );
    },
    RestaurantMenuScreen.name: (routeData) {
      final args = routeData.argsAs<RestaurantMenuScreenArgs>();
      return _i28.CustomPage<dynamic>(
        routeData: routeData,
        child: _i13.RestaurantMenuScreen(
          key: args.key,
          menuList: args.menuList,
          productCategories: args.productCategories,
        ),
        transitionsBuilder: _i28.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderConfirmedScreen.name: (routeData) {
      return _i28.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.OrderConfirmedScreen(),
        transitionsBuilder: _i28.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ProfileScreen(),
      );
    },
    TopUpScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.TopupScreen(),
      );
    },
    AllOrdersPage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.AllOrdersPage(),
      );
    },
    ScheduledOrdersPage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.ScheduledOrdersPage(),
      );
    },
    FAQScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.FAQScreen(),
      );
    },
    AboutScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.AboutScreen(),
      );
    },
    PreparingOrderPage.name: (routeData) {
      final args = routeData.argsAs<PreparingOrderPageArgs>();
      return _i28.CustomPage<dynamic>(
        routeData: routeData,
        child: _i21.PreparingOrderPage(
          key: args.key,
          orderDetails: args.orderDetails,
        ),
        transitionsBuilder: _i28.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShowUserMnemonic.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.ShowUserMnemonicScreen(),
      );
    },
    VerifyUserMnemonic.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.VerifyUserMnemonic(),
      );
    },
    CheckoutScreenPt2.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.CheckoutScreenPt2(),
      );
    },
    GenerateQRFromCart.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.GenerateQRFromCart(),
      );
    },
    ScanPaymentRecipientQR.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.ScanPaymentRecipientQR(),
      );
    },
    TopupScreen.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.TopupScreen(),
      );
    },
    TopupExplained.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.TopupExplained(),
      );
    },
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i28.RouteConfig(
          ChooseSecurityOption.name,
          path: '/choose-security-option',
        ),
        _i28.RouteConfig(
          PinCodeScreen.name,
          path: '/pin-code-screen',
        ),
        _i28.RouteConfig(
          RestoreFromBackupScreen.name,
          path: '/restore-from-backup-screen',
        ),
        _i28.RouteConfig(
          OnBoardScreen.name,
          path: '/on-board-screen',
        ),
        _i28.RouteConfig(
          SignUpScreen.name,
          path: '/sign-up-screen',
        ),
        _i28.RouteConfig(
          VerifyPhoneNumber.name,
          path: '/verify-phone-number',
        ),
        _i28.RouteConfig(
          UserNameScreen.name,
          path: '/user-name-screen',
        ),
        _i28.RouteConfig(
          ReduxStateViewer.name,
          path: '/redux-state-viewer',
        ),
        _i28.RouteConfig(
          MainScreen.name,
          path: '/main-screen',
          guards: [authGuard],
          children: [
            _i28.RouteConfig(
              VeganHomeAltTab.name,
              path: 'veganHomeAlt',
              parent: MainScreen.name,
              children: [
                _i28.RouteConfig(
                  VeganHomeScreenAlt.name,
                  path: '',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  RestaurantMenuScreen.name,
                  path: 'restaurant-menu-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  OrderConfirmedScreen.name,
                  path: 'order-confirmed-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  ProfileScreen.name,
                  path: 'profile-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  TopUpScreen.name,
                  path: 'topup-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  AllOrdersPage.name,
                  path: 'all-orders-page',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  ScheduledOrdersPage.name,
                  path: 'scheduled-orders-page',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  FAQScreen.name,
                  path: 'f-aq-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  AboutScreen.name,
                  path: 'about-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  PreparingOrderPage.name,
                  path: 'preparing-order-page',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  ShowUserMnemonic.name,
                  path: 'show-user-mnemonic-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  VerifyUserMnemonic.name,
                  path: 'verify-user-mnemonic',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  CheckoutScreenPt2.name,
                  path: 'checkout-screen-pt2',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  GenerateQRFromCart.name,
                  path: 'generate-qr-from-cart',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  ScanPaymentRecipientQR.name,
                  path: 'scan-payment-recipient-qR',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
              ],
            ),
            _i28.RouteConfig(
              TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i28.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: TopupTab.name,
                  redirectTo: 'topUp',
                  fullMatch: true,
                ),
                _i28.RouteConfig(
                  TopupScreen.name,
                  path: 'topUp',
                  parent: TopupTab.name,
                ),
                _i28.RouteConfig(
                  TopupExplained.name,
                  path: 'topup-explained',
                  parent: TopupTab.name,
                ),
              ],
            ),
            _i28.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [authGuard],
              children: [
                _i28.RouteConfig(
                  ProfileScreen.name,
                  path: 'profile-screen',
                  parent: AccountTab.name,
                  guards: [authGuard],
                ),
                _i28.RouteConfig(
                  TopupScreen.name,
                  path: 'topUp',
                  parent: AccountTab.name,
                  guards: [authGuard],
                ),
              ],
            ),
          ],
        ),
        _i28.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i28.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({
    _i31.Key? key,
    void Function(bool)? onLoginResult,
  }) : super(
          SplashScreen.name,
          path: '/',
          args: SplashScreenArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
        );

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({
    this.key,
    this.onLoginResult,
  });

  final _i31.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i28.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(
          ChooseSecurityOption.name,
          path: '/choose-security-option',
        );

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i28.PageRouteInfo<void> {
  const PinCodeScreen()
      : super(
          PinCodeScreen.name,
          path: '/pin-code-screen',
        );

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i28.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(
          RestoreFromBackupScreen.name,
          path: '/restore-from-backup-screen',
        );

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i5.OnBoardScreen]
class OnBoardScreen extends _i28.PageRouteInfo<void> {
  const OnBoardScreen()
      : super(
          OnBoardScreen.name,
          path: '/on-board-screen',
        );

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i28.PageRouteInfo<void> {
  const SignUpScreen()
      : super(
          SignUpScreen.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i28.PageRouteInfo<VerifyPhoneNumberArgs> {
  VerifyPhoneNumber({
    _i31.Key? key,
    String? verificationId,
  }) : super(
          VerifyPhoneNumber.name,
          path: '/verify-phone-number',
          args: VerifyPhoneNumberArgs(
            key: key,
            verificationId: verificationId,
          ),
        );

  static const String name = 'VerifyPhoneNumber';
}

class VerifyPhoneNumberArgs {
  const VerifyPhoneNumberArgs({
    this.key,
    this.verificationId,
  });

  final _i31.Key? key;

  final String? verificationId;

  @override
  String toString() {
    return 'VerifyPhoneNumberArgs{key: $key, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i8.UserNameScreen]
class UserNameScreen extends _i28.PageRouteInfo<UserNameScreenArgs> {
  UserNameScreen({_i31.Key? key})
      : super(
          UserNameScreen.name,
          path: '/user-name-screen',
          args: UserNameScreenArgs(key: key),
        );

  static const String name = 'UserNameScreen';
}

class UserNameScreenArgs {
  const UserNameScreenArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'UserNameScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ReduxStateViewer]
class ReduxStateViewer extends _i28.PageRouteInfo<ReduxStateViewerArgs> {
  ReduxStateViewer({
    required _i32.DevToolsStore<_i33.AppState> store,
    _i31.Key? key,
    int actionMaxLines = 2,
    int stateMaxLines = 5,
  }) : super(
          ReduxStateViewer.name,
          path: '/redux-state-viewer',
          args: ReduxStateViewerArgs(
            store: store,
            key: key,
            actionMaxLines: actionMaxLines,
            stateMaxLines: stateMaxLines,
          ),
        );

  static const String name = 'ReduxStateViewer';
}

class ReduxStateViewerArgs {
  const ReduxStateViewerArgs({
    required this.store,
    this.key,
    this.actionMaxLines = 2,
    this.stateMaxLines = 5,
  });

  final _i32.DevToolsStore<_i33.AppState> store;

  final _i31.Key? key;

  final int actionMaxLines;

  final int stateMaxLines;

  @override
  String toString() {
    return 'ReduxStateViewerArgs{store: $store, key: $key, actionMaxLines: $actionMaxLines, stateMaxLines: $stateMaxLines}';
  }
}

/// generated route for
/// [_i10.MainScreen]
class MainScreen extends _i28.PageRouteInfo<void> {
  const MainScreen({List<_i28.PageRouteInfo>? children})
      : super(
          MainScreen.name,
          path: '/main-screen',
          initialChildren: children,
        );

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class VeganHomeAltTab extends _i28.PageRouteInfo<void> {
  const VeganHomeAltTab({List<_i28.PageRouteInfo>? children})
      : super(
          VeganHomeAltTab.name,
          path: 'veganHomeAlt',
          initialChildren: children,
        );

  static const String name = 'VeganHomeAltTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class TopupTab extends _i28.PageRouteInfo<void> {
  const TopupTab({List<_i28.PageRouteInfo>? children})
      : super(
          TopupTab.name,
          path: 'topup',
          initialChildren: children,
        );

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class AccountTab extends _i28.PageRouteInfo<void> {
  const AccountTab({List<_i28.PageRouteInfo>? children})
      : super(
          AccountTab.name,
          path: 'account',
          initialChildren: children,
        );

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i12.VeganHomeScreen]
class VeganHomeScreenAlt extends _i28.PageRouteInfo<void> {
  const VeganHomeScreenAlt()
      : super(
          VeganHomeScreenAlt.name,
          path: '',
        );

  static const String name = 'VeganHomeScreenAlt';
}

/// generated route for
/// [_i13.RestaurantMenuScreen]
class RestaurantMenuScreen
    extends _i28.PageRouteInfo<RestaurantMenuScreenArgs> {
  RestaurantMenuScreen({
    _i31.Key? key,
    required List<_i34.RestaurantMenuItem> menuList,
    required List<String> productCategories,
  }) : super(
          RestaurantMenuScreen.name,
          path: 'restaurant-menu-screen',
          args: RestaurantMenuScreenArgs(
            key: key,
            menuList: menuList,
            productCategories: productCategories,
          ),
        );

  static const String name = 'RestaurantMenuScreen';
}

class RestaurantMenuScreenArgs {
  const RestaurantMenuScreenArgs({
    this.key,
    required this.menuList,
    required this.productCategories,
  });

  final _i31.Key? key;

  final List<_i34.RestaurantMenuItem> menuList;

  final List<String> productCategories;

  @override
  String toString() {
    return 'RestaurantMenuScreenArgs{key: $key, menuList: $menuList, productCategories: $productCategories}';
  }
}

/// generated route for
/// [_i14.OrderConfirmedScreen]
class OrderConfirmedScreen extends _i28.PageRouteInfo<void> {
  const OrderConfirmedScreen()
      : super(
          OrderConfirmedScreen.name,
          path: 'order-confirmed-screen',
        );

  static const String name = 'OrderConfirmedScreen';
}

/// generated route for
/// [_i15.ProfileScreen]
class ProfileScreen extends _i28.PageRouteInfo<void> {
  const ProfileScreen()
      : super(
          ProfileScreen.name,
          path: 'profile-screen',
        );

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i16.TopupScreen]
class TopUpScreen extends _i28.PageRouteInfo<void> {
  const TopUpScreen()
      : super(
          TopUpScreen.name,
          path: 'topup-screen',
        );

  static const String name = 'TopUpScreen';
}

/// generated route for
/// [_i17.AllOrdersPage]
class AllOrdersPage extends _i28.PageRouteInfo<void> {
  const AllOrdersPage()
      : super(
          AllOrdersPage.name,
          path: 'all-orders-page',
        );

  static const String name = 'AllOrdersPage';
}

/// generated route for
/// [_i18.ScheduledOrdersPage]
class ScheduledOrdersPage extends _i28.PageRouteInfo<void> {
  const ScheduledOrdersPage()
      : super(
          ScheduledOrdersPage.name,
          path: 'scheduled-orders-page',
        );

  static const String name = 'ScheduledOrdersPage';
}

/// generated route for
/// [_i19.FAQScreen]
class FAQScreen extends _i28.PageRouteInfo<void> {
  const FAQScreen()
      : super(
          FAQScreen.name,
          path: 'f-aq-screen',
        );

  static const String name = 'FAQScreen';
}

/// generated route for
/// [_i20.AboutScreen]
class AboutScreen extends _i28.PageRouteInfo<void> {
  const AboutScreen()
      : super(
          AboutScreen.name,
          path: 'about-screen',
        );

  static const String name = 'AboutScreen';
}

/// generated route for
/// [_i21.PreparingOrderPage]
class PreparingOrderPage extends _i28.PageRouteInfo<PreparingOrderPageArgs> {
  PreparingOrderPage({
    _i31.Key? key,
    required _i35.OrderDetails orderDetails,
  }) : super(
          PreparingOrderPage.name,
          path: 'preparing-order-page',
          args: PreparingOrderPageArgs(
            key: key,
            orderDetails: orderDetails,
          ),
        );

  static const String name = 'PreparingOrderPage';
}

class PreparingOrderPageArgs {
  const PreparingOrderPageArgs({
    this.key,
    required this.orderDetails,
  });

  final _i31.Key? key;

  final _i35.OrderDetails orderDetails;

  @override
  String toString() {
    return 'PreparingOrderPageArgs{key: $key, orderDetails: $orderDetails}';
  }
}

/// generated route for
/// [_i22.ShowUserMnemonicScreen]
class ShowUserMnemonic extends _i28.PageRouteInfo<void> {
  const ShowUserMnemonic()
      : super(
          ShowUserMnemonic.name,
          path: 'show-user-mnemonic-screen',
        );

  static const String name = 'ShowUserMnemonic';
}

/// generated route for
/// [_i23.VerifyUserMnemonic]
class VerifyUserMnemonic extends _i28.PageRouteInfo<void> {
  const VerifyUserMnemonic()
      : super(
          VerifyUserMnemonic.name,
          path: 'verify-user-mnemonic',
        );

  static const String name = 'VerifyUserMnemonic';
}

/// generated route for
/// [_i24.CheckoutScreenPt2]
class CheckoutScreenPt2 extends _i28.PageRouteInfo<void> {
  const CheckoutScreenPt2()
      : super(
          CheckoutScreenPt2.name,
          path: 'checkout-screen-pt2',
        );

  static const String name = 'CheckoutScreenPt2';
}

/// generated route for
/// [_i25.GenerateQRFromCart]
class GenerateQRFromCart extends _i28.PageRouteInfo<void> {
  const GenerateQRFromCart()
      : super(
          GenerateQRFromCart.name,
          path: 'generate-qr-from-cart',
        );

  static const String name = 'GenerateQRFromCart';
}

/// generated route for
/// [_i26.ScanPaymentRecipientQR]
class ScanPaymentRecipientQR extends _i28.PageRouteInfo<void> {
  const ScanPaymentRecipientQR()
      : super(
          ScanPaymentRecipientQR.name,
          path: 'scan-payment-recipient-qR',
        );

  static const String name = 'ScanPaymentRecipientQR';
}

/// generated route for
/// [_i16.TopupScreen]
class TopupScreen extends _i28.PageRouteInfo<void> {
  const TopupScreen()
      : super(
          TopupScreen.name,
          path: 'topUp',
        );

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i27.TopupExplained]
class TopupExplained extends _i28.PageRouteInfo<void> {
  const TopupExplained()
      : super(
          TopupExplained.name,
          path: 'topup-explained',
        );

  static const String name = 'TopupExplained';
}
