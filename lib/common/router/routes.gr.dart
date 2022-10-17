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
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:auto_route/empty_router_widgets.dart' as _i10;
import 'package:flutter/material.dart' as _i28;

import '../../features/account/screens/account_screen.dart' as _i26;
import '../../features/account/screens/profile.dart' as _i16;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i4;
import '../../features/onboard/screens/security_screen.dart' as _i2;
import '../../features/onboard/screens/show_user_mnemonic.dart' as _i23;
import '../../features/onboard/screens/signup_screen.dart' as _i6;
import '../../features/onboard/screens/username_screen.dart' as _i8;
import '../../features/onboard/screens/verify_screen.dart' as _i7;
import '../../features/onboard/screens/verify_user_mnemonic.dart' as _i24;
import '../../features/screens/main_screen.dart' as _i9;
import '../../features/screens/on_board_screen.dart' as _i5;
import '../../features/screens/pincode_screen.dart' as _i3;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/topup/screens/topup.dart' as _i17;
import '../../features/topup/screens/topup_explained.dart' as _i25;
import '../../features/veganHome/screens/aboutScreen.dart' as _i21;
import '../../features/veganHome/screens/allOrdersPage.dart' as _i18;
import '../../features/veganHome/screens/checkoutScreen.dart' as _i14;
import '../../features/veganHome/screens/faqScreen.dart' as _i20;
import '../../features/veganHome/screens/orderConfirmed.dart' as _i15;
import '../../features/veganHome/screens/preparingOrderScreen.dart' as _i22;
import '../../features/veganHome/screens/restaurantMenuScreen.dart' as _i12;
import '../../features/veganHome/screens/scheduledOrdersPage.dart' as _i19;
import '../../features/veganHome/screens/toteScreen.dart' as _i13;
import '../../features/veganHome/screens/veganHome.dart' as _i11;
import '../../models/restaurant/orderDetails.dart' as _i31;
import '../../models/restaurant/restaurantMenuItem.dart' as _i30;
import 'route_guards.dart' as _i29;

class RootRouter extends _i27.RootStackRouter {
  RootRouter({
    _i28.GlobalKey<_i28.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i29.AuthGuard authGuard;

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SplashScreen(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    ChooseSecurityOption.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseSecurityOption(),
      );
    },
    PinCodeScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.PinCodeScreen(),
      );
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.RestoreFromBackupScreen(),
      );
    },
    OnBoardScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.VerifyPhoneNumber(verificationId: args.verificationId),
      );
    },
    UserNameScreen.name: (routeData) {
      final args = routeData.argsAs<UserNameScreenArgs>(
          orElse: () => const UserNameScreenArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.UserNameScreen(key: args.key),
      );
    },
    MainScreen.name: (routeData) {
      final args = routeData.argsAs<MainScreenArgs>(
          orElse: () => const MainScreenArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.MainScreen(key: args.key),
      );
    },
    VeganHomeAltTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    TopupTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    AccountTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    VeganHomeScreenAlt.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.VeganHomeScreen(),
      );
    },
    RestaurantMenuScreen.name: (routeData) {
      final args = routeData.argsAs<RestaurantMenuScreenArgs>();
      return _i27.CustomPage<dynamic>(
        routeData: routeData,
        child: _i12.RestaurantMenuScreen(
          key: args.key,
          menuList: args.menuList,
        ),
        transitionsBuilder: _i27.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ToteScreen.name: (routeData) {
      return _i27.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.ToteScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckoutScreen.name: (routeData) {
      return _i27.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.CheckoutScreen(),
        transitionsBuilder: _i27.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderConfirmedScreen.name: (routeData) {
      return _i27.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.OrderConfirmedScreen(),
        transitionsBuilder: _i27.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ProfileScreen(key: args.key),
      );
    },
    TopUpScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.TopupScreen(),
      );
    },
    AllOrdersPage.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.AllOrdersPage(),
      );
    },
    ScheduledOrdersPage.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.ScheduledOrdersPage(),
      );
    },
    FAQScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.FAQScreen(),
      );
    },
    AboutScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.AboutScreen(),
      );
    },
    PreparingOrderPage.name: (routeData) {
      final args = routeData.argsAs<PreparingOrderPageArgs>();
      return _i27.CustomPage<dynamic>(
        routeData: routeData,
        child: _i22.PreparingOrderPage(
          key: args.key,
          orderDetails: args.orderDetails,
        ),
        transitionsBuilder: _i27.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShowUserMnemonic.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ShowUserMnemonicScreen(),
      );
    },
    VerifyUserMnemonic.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.VerifyUserMnemonic(),
      );
    },
    TopupScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.TopupScreen(),
      );
    },
    TopupExplained.name: (routeData) {
      final args = routeData.argsAs<TopupExplainedArgs>(
          orElse: () => const TopupExplainedArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.TopupExplained(key: args.key),
      );
    },
    AccountScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.AccountScreen(),
      );
    },
  };

  @override
  List<_i27.RouteConfig> get routes => [
        _i27.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i27.RouteConfig(
          ChooseSecurityOption.name,
          path: '/choose-security-option',
        ),
        _i27.RouteConfig(
          PinCodeScreen.name,
          path: '/pin-code-screen',
        ),
        _i27.RouteConfig(
          RestoreFromBackupScreen.name,
          path: '/restore-from-backup-screen',
        ),
        _i27.RouteConfig(
          OnBoardScreen.name,
          path: '/on-board-screen',
        ),
        _i27.RouteConfig(
          SignUpScreen.name,
          path: '/sign-up-screen',
        ),
        _i27.RouteConfig(
          VerifyPhoneNumber.name,
          path: '/verify-phone-number',
        ),
        _i27.RouteConfig(
          UserNameScreen.name,
          path: '/user-name-screen',
        ),
        _i27.RouteConfig(
          MainScreen.name,
          path: '/main-screen',
          guards: [authGuard],
          children: [
            _i27.RouteConfig(
              VeganHomeAltTab.name,
              path: 'veganHomeAlt',
              parent: MainScreen.name,
              children: [
                _i27.RouteConfig(
                  VeganHomeScreenAlt.name,
                  path: '',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  RestaurantMenuScreen.name,
                  path: 'restaurant-menu-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  ToteScreen.name,
                  path: 'tote-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  CheckoutScreen.name,
                  path: 'checkout-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  OrderConfirmedScreen.name,
                  path: 'order-confirmed-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  ProfileScreen.name,
                  path: 'profile-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  TopUpScreen.name,
                  path: 'topup-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  AllOrdersPage.name,
                  path: 'all-orders-page',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  ScheduledOrdersPage.name,
                  path: 'scheduled-orders-page',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  FAQScreen.name,
                  path: 'f-aq-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  AboutScreen.name,
                  path: 'about-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  PreparingOrderPage.name,
                  path: 'preparing-order-page',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  ShowUserMnemonic.name,
                  path: 'show-user-mnemonic-screen',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  VerifyUserMnemonic.name,
                  path: 'verify-user-mnemonic',
                  parent: VeganHomeAltTab.name,
                  guards: [authGuard],
                ),
              ],
            ),
            _i27.RouteConfig(
              TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i27.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: TopupTab.name,
                  redirectTo: 'topUp',
                  fullMatch: true,
                ),
                _i27.RouteConfig(
                  TopupScreen.name,
                  path: 'topUp',
                  parent: TopupTab.name,
                ),
                _i27.RouteConfig(
                  TopupExplained.name,
                  path: 'topup-explained',
                  parent: TopupTab.name,
                ),
              ],
            ),
            _i27.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [authGuard],
              children: [
                _i27.RouteConfig(
                  AccountScreen.name,
                  path: '',
                  parent: AccountTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  ProfileScreen.name,
                  path: 'profile-screen',
                  parent: AccountTab.name,
                  guards: [authGuard],
                ),
                _i27.RouteConfig(
                  TopupScreen.name,
                  path: 'topUp',
                  parent: AccountTab.name,
                  guards: [authGuard],
                ),
              ],
            ),
          ],
        ),
        _i27.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i27.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({
    _i28.Key? key,
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

  final _i28.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i27.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(
          ChooseSecurityOption.name,
          path: '/choose-security-option',
        );

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i27.PageRouteInfo<void> {
  const PinCodeScreen()
      : super(
          PinCodeScreen.name,
          path: '/pin-code-screen',
        );

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i27.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(
          RestoreFromBackupScreen.name,
          path: '/restore-from-backup-screen',
        );

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i5.OnBoardScreen]
class OnBoardScreen extends _i27.PageRouteInfo<void> {
  const OnBoardScreen()
      : super(
          OnBoardScreen.name,
          path: '/on-board-screen',
        );

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i27.PageRouteInfo<void> {
  const SignUpScreen()
      : super(
          SignUpScreen.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i27.PageRouteInfo<VerifyPhoneNumberArgs> {
  VerifyPhoneNumber({String? verificationId})
      : super(
          VerifyPhoneNumber.name,
          path: '/verify-phone-number',
          args: VerifyPhoneNumberArgs(verificationId: verificationId),
        );

  static const String name = 'VerifyPhoneNumber';
}

class VerifyPhoneNumberArgs {
  const VerifyPhoneNumberArgs({this.verificationId});

  final String? verificationId;

  @override
  String toString() {
    return 'VerifyPhoneNumberArgs{verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i8.UserNameScreen]
class UserNameScreen extends _i27.PageRouteInfo<UserNameScreenArgs> {
  UserNameScreen({_i28.Key? key})
      : super(
          UserNameScreen.name,
          path: '/user-name-screen',
          args: UserNameScreenArgs(key: key),
        );

  static const String name = 'UserNameScreen';
}

class UserNameScreenArgs {
  const UserNameScreenArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'UserNameScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.MainScreen]
class MainScreen extends _i27.PageRouteInfo<MainScreenArgs> {
  MainScreen({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          MainScreen.name,
          path: '/main-screen',
          args: MainScreenArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'MainScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.EmptyRouterPage]
class VeganHomeAltTab extends _i27.PageRouteInfo<void> {
  const VeganHomeAltTab({List<_i27.PageRouteInfo>? children})
      : super(
          VeganHomeAltTab.name,
          path: 'veganHomeAlt',
          initialChildren: children,
        );

  static const String name = 'VeganHomeAltTab';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class TopupTab extends _i27.PageRouteInfo<void> {
  const TopupTab({List<_i27.PageRouteInfo>? children})
      : super(
          TopupTab.name,
          path: 'topup',
          initialChildren: children,
        );

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class AccountTab extends _i27.PageRouteInfo<void> {
  const AccountTab({List<_i27.PageRouteInfo>? children})
      : super(
          AccountTab.name,
          path: 'account',
          initialChildren: children,
        );

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i11.VeganHomeScreen]
class VeganHomeScreenAlt extends _i27.PageRouteInfo<void> {
  const VeganHomeScreenAlt()
      : super(
          VeganHomeScreenAlt.name,
          path: '',
        );

  static const String name = 'VeganHomeScreenAlt';
}

/// generated route for
/// [_i12.RestaurantMenuScreen]
class RestaurantMenuScreen
    extends _i27.PageRouteInfo<RestaurantMenuScreenArgs> {
  RestaurantMenuScreen({
    _i28.Key? key,
    required List<_i30.RestaurantMenuItem> menuList,
  }) : super(
          RestaurantMenuScreen.name,
          path: 'restaurant-menu-screen',
          args: RestaurantMenuScreenArgs(
            key: key,
            menuList: menuList,
          ),
        );

  static const String name = 'RestaurantMenuScreen';
}

class RestaurantMenuScreenArgs {
  const RestaurantMenuScreenArgs({
    this.key,
    required this.menuList,
  });

  final _i28.Key? key;

  final List<_i30.RestaurantMenuItem> menuList;

  @override
  String toString() {
    return 'RestaurantMenuScreenArgs{key: $key, menuList: $menuList}';
  }
}

/// generated route for
/// [_i13.ToteScreen]
class ToteScreen extends _i27.PageRouteInfo<void> {
  const ToteScreen()
      : super(
          ToteScreen.name,
          path: 'tote-screen',
        );

  static const String name = 'ToteScreen';
}

/// generated route for
/// [_i14.CheckoutScreen]
class CheckoutScreen extends _i27.PageRouteInfo<void> {
  const CheckoutScreen()
      : super(
          CheckoutScreen.name,
          path: 'checkout-screen',
        );

  static const String name = 'CheckoutScreen';
}

/// generated route for
/// [_i15.OrderConfirmedScreen]
class OrderConfirmedScreen extends _i27.PageRouteInfo<void> {
  const OrderConfirmedScreen()
      : super(
          OrderConfirmedScreen.name,
          path: 'order-confirmed-screen',
        );

  static const String name = 'OrderConfirmedScreen';
}

/// generated route for
/// [_i16.ProfileScreen]
class ProfileScreen extends _i27.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i28.Key? key})
      : super(
          ProfileScreen.name,
          path: 'profile-screen',
          args: ProfileScreenArgs(key: key),
        );

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.TopupScreen]
class TopUpScreen extends _i27.PageRouteInfo<void> {
  const TopUpScreen()
      : super(
          TopUpScreen.name,
          path: 'topup-screen',
        );

  static const String name = 'TopUpScreen';
}

/// generated route for
/// [_i18.AllOrdersPage]
class AllOrdersPage extends _i27.PageRouteInfo<void> {
  const AllOrdersPage()
      : super(
          AllOrdersPage.name,
          path: 'all-orders-page',
        );

  static const String name = 'AllOrdersPage';
}

/// generated route for
/// [_i19.ScheduledOrdersPage]
class ScheduledOrdersPage extends _i27.PageRouteInfo<void> {
  const ScheduledOrdersPage()
      : super(
          ScheduledOrdersPage.name,
          path: 'scheduled-orders-page',
        );

  static const String name = 'ScheduledOrdersPage';
}

/// generated route for
/// [_i20.FAQScreen]
class FAQScreen extends _i27.PageRouteInfo<void> {
  const FAQScreen()
      : super(
          FAQScreen.name,
          path: 'f-aq-screen',
        );

  static const String name = 'FAQScreen';
}

/// generated route for
/// [_i21.AboutScreen]
class AboutScreen extends _i27.PageRouteInfo<void> {
  const AboutScreen()
      : super(
          AboutScreen.name,
          path: 'about-screen',
        );

  static const String name = 'AboutScreen';
}

/// generated route for
/// [_i22.PreparingOrderPage]
class PreparingOrderPage extends _i27.PageRouteInfo<PreparingOrderPageArgs> {
  PreparingOrderPage({
    _i28.Key? key,
    required _i31.OrderDetails orderDetails,
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

  final _i28.Key? key;

  final _i31.OrderDetails orderDetails;

  @override
  String toString() {
    return 'PreparingOrderPageArgs{key: $key, orderDetails: $orderDetails}';
  }
}

/// generated route for
/// [_i23.ShowUserMnemonicScreen]
class ShowUserMnemonic extends _i27.PageRouteInfo<void> {
  const ShowUserMnemonic()
      : super(
          ShowUserMnemonic.name,
          path: 'show-user-mnemonic-screen',
        );

  static const String name = 'ShowUserMnemonic';
}

/// generated route for
/// [_i24.VerifyUserMnemonic]
class VerifyUserMnemonic extends _i27.PageRouteInfo<void> {
  const VerifyUserMnemonic()
      : super(
          VerifyUserMnemonic.name,
          path: 'verify-user-mnemonic',
        );

  static const String name = 'VerifyUserMnemonic';
}

/// generated route for
/// [_i17.TopupScreen]
class TopupScreen extends _i27.PageRouteInfo<void> {
  const TopupScreen()
      : super(
          TopupScreen.name,
          path: 'topUp',
        );

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i25.TopupExplained]
class TopupExplained extends _i27.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i28.Key? key})
      : super(
          TopupExplained.name,
          path: 'topup-explained',
          args: TopupExplainedArgs(key: key),
        );

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'TopupExplainedArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.AccountScreen]
class AccountScreen extends _i27.PageRouteInfo<void> {
  const AccountScreen()
      : super(
          AccountScreen.name,
          path: '',
        );

  static const String name = 'AccountScreen';
}
