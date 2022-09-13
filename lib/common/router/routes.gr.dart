// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i42;
import 'package:auto_route/empty_router_widgets.dart' as _i11;
import 'package:contacts_service/contacts_service.dart' as _i48;
import 'package:flutter/material.dart' as _i43;

import '../../features/account/screens/account_screen.dart' as _i35;
import '../../features/account/screens/done_backup_screen.dart' as _i38;
import '../../features/account/screens/profile.dart' as _i17;
import '../../features/account/screens/protect_your_wallet.dart' as _i40;
import '../../features/account/screens/settings.dart' as _i39;
import '../../features/account/screens/show_mnemonic.dart' as _i36;
import '../../features/account/screens/social_screen.dart' as _i41;
import '../../features/account/screens/verify_mnemonic.dart' as _i37;
import '../../features/buy/screens/business.dart' as _i34;
import '../../features/buy/screens/buy.dart' as _i33;
import '../../features/contacts/screens/contacts_list.dart' as _i29;
import '../../features/contacts/screens/send_amount.dart' as _i30;
import '../../features/contacts/screens/send_review.dart' as _i31;
import '../../features/contacts/screens/send_success.dart' as _i32;
import '../../features/contacts/send_amount_arguments.dart' as _i49;
import '../../features/home/screens/action_details.dart' as _i27;
import '../../features/home/screens/home.dart' as _i26;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i4;
import '../../features/onboard/screens/security_screen.dart' as _i2;
import '../../features/onboard/screens/show_user_mnemonic.dart' as _i24;
import '../../features/onboard/screens/signup_screen.dart' as _i6;
import '../../features/onboard/screens/username_screen.dart' as _i8;
import '../../features/onboard/screens/verify_screen.dart' as _i7;
import '../../features/onboard/screens/verify_user_mnemonic.dart' as _i25;
import '../../features/screens/main_screen.dart' as _i10;
import '../../features/screens/on_board_screen.dart' as _i5;
import '../../features/screens/pincode_screen.dart' as _i3;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/screens/webview_screen.dart' as _i9;
import '../../features/topup/screens/topup.dart' as _i18;
import '../../features/topup/screens/topup_explained.dart' as _i28;
import '../../features/veganHome/screens/aboutScreen.dart' as _i22;
import '../../features/veganHome/screens/allOrdersPage.dart' as _i19;
import '../../features/veganHome/screens/checkoutScreen.dart' as _i15;
import '../../features/veganHome/screens/faqScreen.dart' as _i21;
import '../../features/veganHome/screens/orderConfirmed.dart' as _i16;
import '../../features/veganHome/screens/preparingOrderScreen.dart' as _i23;
import '../../features/veganHome/screens/restaurantMenuScreen.dart' as _i13;
import '../../features/veganHome/screens/scheduledOrdersPage.dart' as _i20;
import '../../features/veganHome/screens/toteScreen.dart' as _i14;
import '../../features/veganHome/screens/veganHome.dart' as _i12;
import '../../models/actions/wallet_action.dart' as _i47;
import '../../models/community/business.dart' as _i50;
import '../../models/restaurant/orderDetails.dart' as _i46;
import '../../models/restaurant/restaurantMenuItem.dart' as _i45;
import '../../models/tokens/token.dart' as _i51;
import 'route_guards.dart' as _i44;

class RootRouter extends _i42.RootStackRouter {
  RootRouter(
      {_i43.GlobalKey<_i43.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i44.AuthGuard authGuard;

  @override
  final Map<String, _i42.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(
              key: args.key, onLoginResult: args.onLoginResult));
    },
    ChooseSecurityOption.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ChooseSecurityOption());
    },
    PinCodeScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PinCodeScreen());
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RestoreFromBackupScreen());
    },
    OnBoardScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.OnBoardScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.SignUpScreen());
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerifyPhoneNumber(verificationId: args.verificationId));
    },
    UserNameScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.UserNameScreen());
    },
    Webview.name: (routeData) {
      final args = routeData.argsAs<WebviewArgs>();
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.WebViewScreen(args.url, args.title,
              onPageStarted: args.onPageStarted),
          fullscreenDialog: true);
    },
    MainScreen.name: (routeData) {
      final args = routeData.argsAs<MainScreenArgs>(
          orElse: () => const MainScreenArgs());
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.MainScreen(key: args.key));
    },
    VeganHomeAltTab.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    HomeTab.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    TopupTab.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    ContactsTab.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    BuyTab.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    AccountTab.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    VeganHomeScreenAlt.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.VeganHomeScreen());
    },
    RestaurantMenuScreen.name: (routeData) {
      final args = routeData.argsAs<RestaurantMenuScreenArgs>();
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i13.RestaurantMenuScreen(key: args.key, menuList: args.menuList),
          transitionsBuilder: _i42.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    ToteScreen.name: (routeData) {
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i14.ToteScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    CheckoutScreen.name: (routeData) {
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i15.CheckoutScreen(),
          transitionsBuilder: _i42.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    OrderConfirmedScreen.name: (routeData) {
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i16.OrderConfirmedScreen(),
          transitionsBuilder: _i42.TransitionsBuilders.slideBottom,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.ProfileScreen(key: args.key));
    },
    TopUpScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.TopupScreen());
    },
    AllOrdersPage.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.AllOrdersPage());
    },
    ScheduledOrdersPage.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.ScheduledOrdersPage());
    },
    FAQScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.FAQScreen());
    },
    AboutScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.AboutScreen());
    },
    PreparingOrderPage.name: (routeData) {
      final args = routeData.argsAs<PreparingOrderPageArgs>();
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child: _i23.PreparingOrderPage(
              key: args.key, orderDetails: args.orderDetails),
          transitionsBuilder: _i42.TransitionsBuilders.slideBottom,
          opaque: true,
          barrierDismissible: false);
    },
    ShowUserMnemonic.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.ShowUserMnemonicScreen());
    },
    VerifyUserMnemonic.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.VerifyUserMnemonic());
    },
    HomeScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.HomeScreen());
    },
    ActionDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<ActionDetailsScreenArgs>();
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i27.ActionDetailsScreen(
              action: args.action,
              image: args.image,
              displayName: args.displayName,
              accountAddress: args.accountAddress,
              symbol: args.symbol,
              contact: args.contact));
    },
    TopupScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.TopupScreen());
    },
    TopupExplained.name: (routeData) {
      final args = routeData.argsAs<TopupExplainedArgs>(
          orElse: () => const TopupExplainedArgs());
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i28.TopupExplained(key: args.key));
    },
    ContactsList.name: (routeData) {
      final args = routeData.argsAs<ContactsListArgs>(
          orElse: () => const ContactsListArgs());
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i29.ContactsList(pageArgs: args.pageArgs));
    },
    SendAmountScreen.name: (routeData) {
      final args = routeData.argsAs<SendAmountScreenArgs>();
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i30.SendAmountScreen(pageArgs: args.pageArgs));
    },
    SendReviewScreen.name: (routeData) {
      final args = routeData.argsAs<SendReviewScreenArgs>();
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i31.SendReviewScreen(pageArgs: args.pageArgs));
    },
    SendSuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SendSuccessScreenArgs>();
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i32.SendSuccessScreen(pageArgs: args.pageArgs));
    },
    BuyScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i33.BuyScreen());
    },
    BusinessScreen.name: (routeData) {
      final args = routeData.argsAs<BusinessScreenArgs>();
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i34.BusinessScreen(business: args.business, token: args.token));
    },
    AccountScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i35.AccountScreen());
    },
    ShowMnemonic.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i36.ShowMnemonic());
    },
    VerifyMnemonic.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i37.VerifyMnemonic());
    },
    DoneBackup.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i38.DoneBackup());
    },
    SettingsScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i39.SettingsScreen());
    },
    ProtectYourWallet.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i40.ProtectYourWallet());
    },
    SocialScreen.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
          routeData: routeData, child: _i41.SocialScreen());
    }
  };

  @override
  List<_i42.RouteConfig> get routes => [
        _i42.RouteConfig(SplashScreen.name, path: '/'),
        _i42.RouteConfig(ChooseSecurityOption.name,
            path: '/choose-security-option'),
        _i42.RouteConfig(PinCodeScreen.name, path: '/pin-code-screen'),
        _i42.RouteConfig(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen'),
        _i42.RouteConfig(OnBoardScreen.name, path: '/on-board-screen'),
        _i42.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i42.RouteConfig(VerifyPhoneNumber.name, path: '/verify-phone-number'),
        _i42.RouteConfig(UserNameScreen.name, path: '/user-name-screen'),
        _i42.RouteConfig(Webview.name, path: '/web-view-screen'),
        _i42.RouteConfig(MainScreen.name, path: '/main-screen', guards: [
          authGuard
        ], children: [
          _i42.RouteConfig(VeganHomeAltTab.name,
              path: 'veganHomeAlt',
              parent: MainScreen.name,
              children: [
                _i42.RouteConfig(VeganHomeScreenAlt.name,
                    path: '',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(RestaurantMenuScreen.name,
                    path: 'restaurant-menu-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(ToteScreen.name,
                    path: 'tote-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(CheckoutScreen.name,
                    path: 'checkout-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(OrderConfirmedScreen.name,
                    path: 'order-confirmed-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(ProfileScreen.name,
                    path: 'profile-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(TopUpScreen.name,
                    path: 'topup-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(AllOrdersPage.name,
                    path: 'all-orders-page',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(ScheduledOrdersPage.name,
                    path: 'scheduled-orders-page',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(FAQScreen.name,
                    path: 'f-aq-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(AboutScreen.name,
                    path: 'about-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(PreparingOrderPage.name,
                    path: 'preparing-order-page',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(ShowUserMnemonic.name,
                    path: 'show-user-mnemonic-screen',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(VerifyUserMnemonic.name,
                    path: 'verify-user-mnemonic',
                    parent: VeganHomeAltTab.name,
                    guards: [authGuard])
              ]),
          _i42.RouteConfig(HomeTab.name,
              path: 'home',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i42.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeTab.name, guards: [authGuard]),
                _i42.RouteConfig(ActionDetailsScreen.name,
                    path: 'action-details-screen',
                    parent: HomeTab.name,
                    guards: [authGuard])
              ]),
          _i42.RouteConfig(TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i42.RouteConfig('#redirect',
                    path: '',
                    parent: TopupTab.name,
                    redirectTo: 'topUp',
                    fullMatch: true),
                _i42.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: TopupTab.name),
                _i42.RouteConfig(TopupExplained.name,
                    path: 'topup-explained', parent: TopupTab.name)
              ]),
          _i42.RouteConfig(ContactsTab.name,
              path: 'contacts',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i42.RouteConfig(ContactsList.name,
                    path: '', parent: ContactsTab.name, guards: [authGuard]),
                _i42.RouteConfig(SendAmountScreen.name,
                    path: 'send-amount',
                    parent: ContactsTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(SendReviewScreen.name,
                    path: 'send-review',
                    parent: ContactsTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(SendSuccessScreen.name,
                    path: 'send-success',
                    parent: ContactsTab.name,
                    guards: [authGuard])
              ]),
          _i42.RouteConfig(BuyTab.name,
              path: 'buy',
              parent: MainScreen.name,
              children: [
                _i42.RouteConfig(BuyScreen.name, path: '', parent: BuyTab.name),
                _i42.RouteConfig(BusinessScreen.name,
                    path: 'business-screen', parent: BuyTab.name)
              ]),
          _i42.RouteConfig(AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i42.RouteConfig(AccountScreen.name,
                    path: '', parent: AccountTab.name, guards: [authGuard]),
                _i42.RouteConfig(ShowMnemonic.name,
                    path: 'show-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(VerifyMnemonic.name,
                    path: 'verify-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(DoneBackup.name,
                    path: 'done-backup',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(SettingsScreen.name,
                    path: 'settings-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(ProtectYourWallet.name,
                    path: 'protect-your-wallet',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(ProfileScreen.name,
                    path: 'profile-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(SocialScreen.name,
                    path: 'social-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i42.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: AccountTab.name, guards: [authGuard])
              ])
        ]),
        _i42.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i42.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({_i43.Key? key, void Function(bool)? onLoginResult})
      : super(SplashScreen.name,
            path: '/',
            args: SplashScreenArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({this.key, this.onLoginResult});

  final _i43.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i42.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(ChooseSecurityOption.name, path: '/choose-security-option');

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i42.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: '/pin-code-screen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i42.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen');

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i5.OnBoardScreen]
class OnBoardScreen extends _i42.PageRouteInfo<void> {
  const OnBoardScreen() : super(OnBoardScreen.name, path: '/on-board-screen');

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i42.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i42.PageRouteInfo<VerifyPhoneNumberArgs> {
  VerifyPhoneNumber({String? verificationId})
      : super(VerifyPhoneNumber.name,
            path: '/verify-phone-number',
            args: VerifyPhoneNumberArgs(verificationId: verificationId));

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
class UserNameScreen extends _i42.PageRouteInfo<void> {
  const UserNameScreen()
      : super(UserNameScreen.name, path: '/user-name-screen');

  static const String name = 'UserNameScreen';
}

/// generated route for
/// [_i9.WebViewScreen]
class Webview extends _i42.PageRouteInfo<WebviewArgs> {
  Webview(
      {required String url,
      required String title,
      void Function(String)? onPageStarted})
      : super(Webview.name,
            path: '/web-view-screen',
            args: WebviewArgs(
                url: url, title: title, onPageStarted: onPageStarted));

  static const String name = 'Webview';
}

class WebviewArgs {
  const WebviewArgs(
      {required this.url, required this.title, this.onPageStarted});

  final String url;

  final String title;

  final void Function(String)? onPageStarted;

  @override
  String toString() {
    return 'WebviewArgs{url: $url, title: $title, onPageStarted: $onPageStarted}';
  }
}

/// generated route for
/// [_i10.MainScreen]
class MainScreen extends _i42.PageRouteInfo<MainScreenArgs> {
  MainScreen({_i43.Key? key, List<_i42.PageRouteInfo>? children})
      : super(MainScreen.name,
            path: '/main-screen',
            args: MainScreenArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return 'MainScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.EmptyRouterPage]
class VeganHomeAltTab extends _i42.PageRouteInfo<void> {
  const VeganHomeAltTab({List<_i42.PageRouteInfo>? children})
      : super(VeganHomeAltTab.name,
            path: 'veganHomeAlt', initialChildren: children);

  static const String name = 'VeganHomeAltTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class HomeTab extends _i42.PageRouteInfo<void> {
  const HomeTab({List<_i42.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class TopupTab extends _i42.PageRouteInfo<void> {
  const TopupTab({List<_i42.PageRouteInfo>? children})
      : super(TopupTab.name, path: 'topup', initialChildren: children);

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class ContactsTab extends _i42.PageRouteInfo<void> {
  const ContactsTab({List<_i42.PageRouteInfo>? children})
      : super(ContactsTab.name, path: 'contacts', initialChildren: children);

  static const String name = 'ContactsTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class BuyTab extends _i42.PageRouteInfo<void> {
  const BuyTab({List<_i42.PageRouteInfo>? children})
      : super(BuyTab.name, path: 'buy', initialChildren: children);

  static const String name = 'BuyTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class AccountTab extends _i42.PageRouteInfo<void> {
  const AccountTab({List<_i42.PageRouteInfo>? children})
      : super(AccountTab.name, path: 'account', initialChildren: children);

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i12.VeganHomeScreen]
class VeganHomeScreenAlt extends _i42.PageRouteInfo<void> {
  const VeganHomeScreenAlt() : super(VeganHomeScreenAlt.name, path: '');

  static const String name = 'VeganHomeScreenAlt';
}

/// generated route for
/// [_i13.RestaurantMenuScreen]
class RestaurantMenuScreen
    extends _i42.PageRouteInfo<RestaurantMenuScreenArgs> {
  RestaurantMenuScreen(
      {_i43.Key? key, required List<_i45.RestaurantMenuItem> menuList})
      : super(RestaurantMenuScreen.name,
            path: 'restaurant-menu-screen',
            args: RestaurantMenuScreenArgs(key: key, menuList: menuList));

  static const String name = 'RestaurantMenuScreen';
}

class RestaurantMenuScreenArgs {
  const RestaurantMenuScreenArgs({this.key, required this.menuList});

  final _i43.Key? key;

  final List<_i45.RestaurantMenuItem> menuList;

  @override
  String toString() {
    return 'RestaurantMenuScreenArgs{key: $key, menuList: $menuList}';
  }
}

/// generated route for
/// [_i14.ToteScreen]
class ToteScreen extends _i42.PageRouteInfo<void> {
  const ToteScreen() : super(ToteScreen.name, path: 'tote-screen');

  static const String name = 'ToteScreen';
}

/// generated route for
/// [_i15.CheckoutScreen]
class CheckoutScreen extends _i42.PageRouteInfo<void> {
  const CheckoutScreen() : super(CheckoutScreen.name, path: 'checkout-screen');

  static const String name = 'CheckoutScreen';
}

/// generated route for
/// [_i16.OrderConfirmedScreen]
class OrderConfirmedScreen extends _i42.PageRouteInfo<void> {
  const OrderConfirmedScreen()
      : super(OrderConfirmedScreen.name, path: 'order-confirmed-screen');

  static const String name = 'OrderConfirmedScreen';
}

/// generated route for
/// [_i17.ProfileScreen]
class ProfileScreen extends _i42.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i43.Key? key})
      : super(ProfileScreen.name,
            path: 'profile-screen', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.TopupScreen]
class TopUpScreen extends _i42.PageRouteInfo<void> {
  const TopUpScreen() : super(TopUpScreen.name, path: 'topup-screen');

  static const String name = 'TopUpScreen';
}

/// generated route for
/// [_i19.AllOrdersPage]
class AllOrdersPage extends _i42.PageRouteInfo<void> {
  const AllOrdersPage() : super(AllOrdersPage.name, path: 'all-orders-page');

  static const String name = 'AllOrdersPage';
}

/// generated route for
/// [_i20.ScheduledOrdersPage]
class ScheduledOrdersPage extends _i42.PageRouteInfo<void> {
  const ScheduledOrdersPage()
      : super(ScheduledOrdersPage.name, path: 'scheduled-orders-page');

  static const String name = 'ScheduledOrdersPage';
}

/// generated route for
/// [_i21.FAQScreen]
class FAQScreen extends _i42.PageRouteInfo<void> {
  const FAQScreen() : super(FAQScreen.name, path: 'f-aq-screen');

  static const String name = 'FAQScreen';
}

/// generated route for
/// [_i22.AboutScreen]
class AboutScreen extends _i42.PageRouteInfo<void> {
  const AboutScreen() : super(AboutScreen.name, path: 'about-screen');

  static const String name = 'AboutScreen';
}

/// generated route for
/// [_i23.PreparingOrderPage]
class PreparingOrderPage extends _i42.PageRouteInfo<PreparingOrderPageArgs> {
  PreparingOrderPage({_i43.Key? key, required _i46.OrderDetails orderDetails})
      : super(PreparingOrderPage.name,
            path: 'preparing-order-page',
            args: PreparingOrderPageArgs(key: key, orderDetails: orderDetails));

  static const String name = 'PreparingOrderPage';
}

class PreparingOrderPageArgs {
  const PreparingOrderPageArgs({this.key, required this.orderDetails});

  final _i43.Key? key;

  final _i46.OrderDetails orderDetails;

  @override
  String toString() {
    return 'PreparingOrderPageArgs{key: $key, orderDetails: $orderDetails}';
  }
}

/// generated route for
/// [_i24.ShowUserMnemonicScreen]
class ShowUserMnemonic extends _i42.PageRouteInfo<void> {
  const ShowUserMnemonic()
      : super(ShowUserMnemonic.name, path: 'show-user-mnemonic-screen');

  static const String name = 'ShowUserMnemonic';
}

/// generated route for
/// [_i25.VerifyUserMnemonic]
class VerifyUserMnemonic extends _i42.PageRouteInfo<void> {
  const VerifyUserMnemonic()
      : super(VerifyUserMnemonic.name, path: 'verify-user-mnemonic');

  static const String name = 'VerifyUserMnemonic';
}

/// generated route for
/// [_i26.HomeScreen]
class HomeScreen extends _i42.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i27.ActionDetailsScreen]
class ActionDetailsScreen extends _i42.PageRouteInfo<ActionDetailsScreenArgs> {
  ActionDetailsScreen(
      {required _i47.WalletAction action,
      _i43.ImageProvider<Object>? image,
      required String displayName,
      String? accountAddress,
      required String symbol,
      _i48.Contact? contact})
      : super(ActionDetailsScreen.name,
            path: 'action-details-screen',
            args: ActionDetailsScreenArgs(
                action: action,
                image: image,
                displayName: displayName,
                accountAddress: accountAddress,
                symbol: symbol,
                contact: contact));

  static const String name = 'ActionDetailsScreen';
}

class ActionDetailsScreenArgs {
  const ActionDetailsScreenArgs(
      {required this.action,
      this.image,
      required this.displayName,
      this.accountAddress,
      required this.symbol,
      this.contact});

  final _i47.WalletAction action;

  final _i43.ImageProvider<Object>? image;

  final String displayName;

  final String? accountAddress;

  final String symbol;

  final _i48.Contact? contact;

  @override
  String toString() {
    return 'ActionDetailsScreenArgs{action: $action, image: $image, displayName: $displayName, accountAddress: $accountAddress, symbol: $symbol, contact: $contact}';
  }
}

/// generated route for
/// [_i18.TopupScreen]
class TopupScreen extends _i42.PageRouteInfo<void> {
  const TopupScreen() : super(TopupScreen.name, path: 'topUp');

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i28.TopupExplained]
class TopupExplained extends _i42.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i43.Key? key})
      : super(TopupExplained.name,
            path: 'topup-explained', args: TopupExplainedArgs(key: key));

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i43.Key? key;

  @override
  String toString() {
    return 'TopupExplainedArgs{key: $key}';
  }
}

/// generated route for
/// [_i29.ContactsList]
class ContactsList extends _i42.PageRouteInfo<ContactsListArgs> {
  ContactsList({_i49.SendFlowArguments? pageArgs})
      : super(ContactsList.name,
            path: '', args: ContactsListArgs(pageArgs: pageArgs));

  static const String name = 'ContactsList';
}

class ContactsListArgs {
  const ContactsListArgs({this.pageArgs});

  final _i49.SendFlowArguments? pageArgs;

  @override
  String toString() {
    return 'ContactsListArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i30.SendAmountScreen]
class SendAmountScreen extends _i42.PageRouteInfo<SendAmountScreenArgs> {
  SendAmountScreen({required _i49.SendFlowArguments pageArgs})
      : super(SendAmountScreen.name,
            path: 'send-amount',
            args: SendAmountScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendAmountScreen';
}

class SendAmountScreenArgs {
  const SendAmountScreenArgs({required this.pageArgs});

  final _i49.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendAmountScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i31.SendReviewScreen]
class SendReviewScreen extends _i42.PageRouteInfo<SendReviewScreenArgs> {
  SendReviewScreen({required _i49.SendFlowArguments pageArgs})
      : super(SendReviewScreen.name,
            path: 'send-review',
            args: SendReviewScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendReviewScreen';
}

class SendReviewScreenArgs {
  const SendReviewScreenArgs({required this.pageArgs});

  final _i49.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendReviewScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i32.SendSuccessScreen]
class SendSuccessScreen extends _i42.PageRouteInfo<SendSuccessScreenArgs> {
  SendSuccessScreen({required _i49.SendFlowArguments pageArgs})
      : super(SendSuccessScreen.name,
            path: 'send-success',
            args: SendSuccessScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendSuccessScreen';
}

class SendSuccessScreenArgs {
  const SendSuccessScreenArgs({required this.pageArgs});

  final _i49.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendSuccessScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i33.BuyScreen]
class BuyScreen extends _i42.PageRouteInfo<void> {
  const BuyScreen() : super(BuyScreen.name, path: '');

  static const String name = 'BuyScreen';
}

/// generated route for
/// [_i34.BusinessScreen]
class BusinessScreen extends _i42.PageRouteInfo<BusinessScreenArgs> {
  BusinessScreen({required _i50.Business business, required _i51.Token token})
      : super(BusinessScreen.name,
            path: 'business-screen',
            args: BusinessScreenArgs(business: business, token: token));

  static const String name = 'BusinessScreen';
}

class BusinessScreenArgs {
  const BusinessScreenArgs({required this.business, required this.token});

  final _i50.Business business;

  final _i51.Token token;

  @override
  String toString() {
    return 'BusinessScreenArgs{business: $business, token: $token}';
  }
}

/// generated route for
/// [_i35.AccountScreen]
class AccountScreen extends _i42.PageRouteInfo<void> {
  const AccountScreen() : super(AccountScreen.name, path: '');

  static const String name = 'AccountScreen';
}

/// generated route for
/// [_i36.ShowMnemonic]
class ShowMnemonic extends _i42.PageRouteInfo<void> {
  const ShowMnemonic() : super(ShowMnemonic.name, path: 'show-mnemonic');

  static const String name = 'ShowMnemonic';
}

/// generated route for
/// [_i37.VerifyMnemonic]
class VerifyMnemonic extends _i42.PageRouteInfo<void> {
  const VerifyMnemonic() : super(VerifyMnemonic.name, path: 'verify-mnemonic');

  static const String name = 'VerifyMnemonic';
}

/// generated route for
/// [_i38.DoneBackup]
class DoneBackup extends _i42.PageRouteInfo<void> {
  const DoneBackup() : super(DoneBackup.name, path: 'done-backup');

  static const String name = 'DoneBackup';
}

/// generated route for
/// [_i39.SettingsScreen]
class SettingsScreen extends _i42.PageRouteInfo<void> {
  const SettingsScreen() : super(SettingsScreen.name, path: 'settings-screen');

  static const String name = 'SettingsScreen';
}

/// generated route for
/// [_i40.ProtectYourWallet]
class ProtectYourWallet extends _i42.PageRouteInfo<void> {
  const ProtectYourWallet()
      : super(ProtectYourWallet.name, path: 'protect-your-wallet');

  static const String name = 'ProtectYourWallet';
}

/// generated route for
/// [_i41.SocialScreen]
class SocialScreen extends _i42.PageRouteInfo<void> {
  const SocialScreen() : super(SocialScreen.name, path: 'social-screen');

  static const String name = 'SocialScreen';
}
