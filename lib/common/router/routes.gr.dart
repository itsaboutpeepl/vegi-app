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
import 'dart:io' as _i52;

import 'package:auto_route/auto_route.dart' as _i47;
import 'package:auto_route/empty_router_widgets.dart' as _i32;
import 'package:flutter/foundation.dart' as _i50;
import 'package:flutter/material.dart' as _i48;
import 'package:redux_dev_tools/redux_dev_tools.dart' as _i53;

import '../../constants/enums.dart' as _i51;
import '../../features/account/screens/profile.dart' as _i9;
import '../../features/onboard/screens/create_email_password_screen.dart'
    as _i14;
import '../../features/onboard/screens/createWalletFirstScreen.dart' as _i20;
import '../../features/onboard/screens/firebaseAuthLink.dart' as _i5;
import '../../features/onboard/screens/registerEmailOnboardingScreen.dart'
    as _i18;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i7;
import '../../features/onboard/screens/security_screen.dart' as _i3;
import '../../features/onboard/screens/set_email_onboarding_screen.dart'
    as _i13;
import '../../features/onboard/screens/show_user_mnemonic.dart' as _i30;
import '../../features/onboard/screens/signup_email_link_screen.dart' as _i12;
import '../../features/onboard/screens/signup_email_password_screen.dart'
    as _i11;
import '../../features/onboard/screens/signup_screen.dart' as _i10;
import '../../features/onboard/screens/username_screen.dart' as _i16;
import '../../features/onboard/screens/verify_screen.dart' as _i15;
import '../../features/onboard/screens/verify_user_mnemonic.dart' as _i31;
import '../../features/onboard/screens/verifyEmailLink.dart' as _i4;
import '../../features/pay/screens/generate_QR_from_cart_screen.dart' as _i43;
import '../../features/pay/screens/scan_payment_recipient_qr.dart' as _i44;
import '../../features/screens/main_screen.dart' as _i29;
import '../../features/screens/on_board_screen.dart' as _i8;
import '../../features/screens/pincode_screen.dart' as _i6;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/topup/screens/topup.dart' as _i36;
import '../../features/topup/screens/topup_explained.dart' as _i46;
import '../../features/veganHome/screens/aboutScreen.dart' as _i40;
import '../../features/veganHome/screens/allOrdersPage.dart' as _i37;
import '../../features/veganHome/screens/checkout_screen_2.dart' as _i42;
import '../../features/veganHome/screens/faqScreen.dart' as _i39;
import '../../features/veganHome/screens/imageFromGalleryEx.dart' as _i27;
import '../../features/veganHome/screens/orderConfirmed.dart' as _i35;
import '../../features/veganHome/screens/preparingOrderScreen.dart' as _i41;
import '../../features/veganHome/screens/restaurantMenuScreen.dart' as _i34;
import '../../features/veganHome/screens/scan_listed_product_qrcode.dart'
    as _i45;
import '../../features/veganHome/screens/scheduledOrdersPage.dart' as _i38;
import '../../features/veganHome/screens/suggestProductFunnel.dart' as _i26;
import '../../features/veganHome/screens/veganHome.dart' as _i33;
import '../../features/veganHome/widgets/shared/redux_state_viewer.dart'
    as _i28;
import '../../features/waitingListFunnel/screens/addDiscountCodeScreen.dart'
    as _i24;
import '../../features/waitingListFunnel/screens/preLaunchPerksDetailsPage.dart'
    as _i22;
import '../../features/waitingListFunnel/screens/registerEmailNotificationsScreen.dart'
    as _i19;
import '../../features/waitingListFunnel/screens/surveyThanksScreen.dart'
    as _i25;
import '../../features/waitingListFunnel/screens/waitingListFunnel.dart'
    as _i17;
import '../../features/waitingListFunnel/screens/waitingListPositionInQueuePage.dart'
    as _i23;
import '../../features/waitingListFunnel/screens/waitingListSurveyQuestions.dart'
    as _i21;
import '../../models/app_state.dart' as _i54;
import '../../models/cart/order.dart' as _i55;
import '../../redux/viewsmodels/reset_app.dart' as _i2;
import 'route_guards.dart' as _i49;

class RootRouter extends _i47.RootStackRouter {
  RootRouter({
    _i48.GlobalKey<_i48.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i49.AuthGuard authGuard;

  @override
  final Map<String, _i47.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SplashScreen(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    ResetApp.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ResetApp(),
      );
    },
    ChooseSecurityOption.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ChooseSecurityOption(),
      );
    },
    VerifyEmailLinkRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailLinkRouteArgs>();
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.VerifyEmailLinkPage(
          emailAddress: args.emailAddress,
          emailLinkFromVerificationEmail: args.emailLinkFromVerificationEmail,
          key: args.key,
        ),
      );
    },
    FirebaseAuthLinkRoute.name: (routeData) {
      final args = routeData.argsAs<FirebaseAuthLinkRouteArgs>(
          orElse: () => const FirebaseAuthLinkRouteArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FirebaseAuthLinkPage(
          recaptchaToken: args.recaptchaToken,
          deepLinkId: args.deepLinkId,
          key: args.key,
        ),
      );
    },
    PinCodeScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PinCodeScreen(),
      );
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RestoreFromBackupScreen(),
      );
    },
    OnBoardScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoardScreen(),
      );
    },
    ProfileScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.SignUpScreen(),
      );
    },
    SignUpWithEmailAndPasswordScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.SignUpWithEmailAndPasswordScreen(),
      );
    },
    SignUpEmailLinkScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.SignUpEmailLinkScreen(),
      );
    },
    SetEmailOnboardingScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.SetEmailOnboardingScreen(),
      );
    },
    CreateWithEmailAndPasswordScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.CreateWithEmailAndPasswordScreen(),
      );
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.VerifyPhoneNumber(
          key: args.key,
          verificationId: args.verificationId,
        ),
      );
    },
    UserNameScreen.name: (routeData) {
      final args = routeData.argsAs<UserNameScreenArgs>(
          orElse: () => const UserNameScreenArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.UserNameScreen(key: args.key),
      );
    },
    WaitingListFunnelScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.WaitingListFunnelScreen(),
      );
    },
    RegisterEmailOnBoardingScreen.name: (routeData) {
      final args = routeData.argsAs<RegisterEmailOnBoardingScreenArgs>(
          orElse: () => const RegisterEmailOnBoardingScreenArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.RegisterEmailOnBoardingScreen(
          key: args.key,
          onSubmitEmail: args.onSubmitEmail,
        ),
      );
    },
    RegisterEmailNotificationsScreen.name: (routeData) {
      final args = routeData.argsAs<RegisterEmailNotificationsScreenArgs>(
          orElse: () => const RegisterEmailNotificationsScreenArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.RegisterEmailNotificationsScreen(
          key: args.key,
          onSubmitEmail: args.onSubmitEmail,
        ),
      );
    },
    CreateWalletFirstOnboardingScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.CreateWalletFirstOnboardingScreen(),
      );
    },
    WaitingListSurveyQuestionsScreens.name: (routeData) {
      final args = routeData.argsAs<WaitingListSurveyQuestionsScreensArgs>();
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.WaitingListSurveyQuestionsScreens(
          key: args.key,
          surveyCompleted: args.surveyCompleted,
        ),
      );
    },
    PreLaunchPerksDetailsRoute.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.PreLaunchPerksDetailsPage(),
      );
    },
    WaitingListPositionInQueueRoute.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.WaitingListPositionInQueuePage(),
      );
    },
    AddDiscountCodeScreen.name: (routeData) {
      final args = routeData.argsAs<AddDiscountCodeScreenArgs>();
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.AddDiscountCodeScreen(
          key: args.key,
          onVerifyDiscountCode: args.onVerifyDiscountCode,
        ),
      );
    },
    SurveyThanksScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.SurveyThanksScreen(),
      );
    },
    SuggestProductFunnelScreen.name: (routeData) {
      final args = routeData.argsAs<SuggestProductFunnelScreenArgs>(
          orElse: () => const SuggestProductFunnelScreenArgs());
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.SuggestProductFunnelScreen(
          key: args.key,
          scannedQRCode: args.scannedQRCode,
        ),
      );
    },
    ImageFromGalleryEx.name: (routeData) {
      final args = routeData.argsAs<ImageFromGalleryExArgs>();
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.ImageFromGalleryEx(
          args.type,
          key: args.key,
          handleImagePicked: args.handleImagePicked,
        ),
      );
    },
    ReduxStateViewer.name: (routeData) {
      final args = routeData.argsAs<ReduxStateViewerArgs>();
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.ReduxStateViewer(
          args.store,
          key: args.key,
          actionMaxLines: args.actionMaxLines,
          stateMaxLines: args.stateMaxLines,
        ),
      );
    },
    MainScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.MainScreen(),
      );
    },
    ShowUserMnemonic.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.ShowUserMnemonicScreen(),
      );
    },
    VerifyUserMnemonic.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.VerifyUserMnemonic(),
      );
    },
    AccountTab.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.EmptyRouterPage(),
      );
    },
    VeganHomeTab.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.EmptyRouterPage(),
      );
    },
    TopupTab.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.EmptyRouterPage(),
      );
    },
    VeganHomeScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.VeganHomeScreen(),
      );
    },
    RestaurantMenuScreen.name: (routeData) {
      return _i47.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i34.RestaurantMenuScreen(),
        transitionsBuilder: _i47.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderConfirmedScreen.name: (routeData) {
      return _i47.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i35.OrderConfirmedScreen(),
        transitionsBuilder: _i47.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TopUpScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.TopupScreen(),
      );
    },
    AllOrdersPage.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.AllOrdersPage(),
      );
    },
    ScheduledOrdersPage.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i38.ScheduledOrdersPage(),
      );
    },
    FAQScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.FAQScreen(),
      );
    },
    AboutScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i40.AboutScreen(),
      );
    },
    PreparingOrderPage.name: (routeData) {
      final args = routeData.argsAs<PreparingOrderPageArgs>();
      return _i47.CustomPage<dynamic>(
        routeData: routeData,
        child: _i41.PreparingOrderPage(
          key: args.key,
          order: args.order,
        ),
        transitionsBuilder: _i47.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckoutScreenPt2.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.CheckoutScreenPt2(),
      );
    },
    GenerateQRFromCartScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i43.GenerateQRFromCartScreen(),
      );
    },
    ScanPaymentRecipientQR.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i44.ScanPaymentRecipientQR(),
      );
    },
    ScanProductQRCode.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i45.ScanListedProductQRCodeScreen(),
      );
    },
    TopupScreen.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.TopupScreen(),
      );
    },
    TopupExplained.name: (routeData) {
      return _i47.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.TopupExplained(),
      );
    },
  };

  @override
  List<_i47.RouteConfig> get routes => [
        _i47.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i47.RouteConfig(
          ResetApp.name,
          path: '/reset-app',
        ),
        _i47.RouteConfig(
          ChooseSecurityOption.name,
          path: '/choose-security-option',
        ),
        _i47.RouteConfig(
          VerifyEmailLinkRoute.name,
          path: '/verify-email-link-page',
        ),
        _i47.RouteConfig(
          FirebaseAuthLinkRoute.name,
          path: 'firebaseauth/link',
        ),
        _i47.RouteConfig(
          PinCodeScreen.name,
          path: '/pin-code-screen',
        ),
        _i47.RouteConfig(
          RestoreFromBackupScreen.name,
          path: '/restore-from-backup-screen',
        ),
        _i47.RouteConfig(
          OnBoardScreen.name,
          path: '/on-board-screen',
          children: [
            _i47.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: OnBoardScreen.name,
            )
          ],
        ),
        _i47.RouteConfig(
          ProfileScreen.name,
          path: '/profile-screen',
        ),
        _i47.RouteConfig(
          SignUpScreen.name,
          path: '/sign-up-screen',
          children: [
            _i47.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: SignUpScreen.name,
            )
          ],
        ),
        _i47.RouteConfig(
          SignUpWithEmailAndPasswordScreen.name,
          path: '/sign-up-with-email-and-password-screen',
          children: [
            _i47.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: SignUpWithEmailAndPasswordScreen.name,
            )
          ],
        ),
        _i47.RouteConfig(
          SignUpEmailLinkScreen.name,
          path: '/sign-up-email-link-screen',
          children: [
            _i47.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: SignUpEmailLinkScreen.name,
            )
          ],
        ),
        _i47.RouteConfig(
          SetEmailOnboardingScreen.name,
          path: '/set-email-onboarding-screen',
        ),
        _i47.RouteConfig(
          CreateWithEmailAndPasswordScreen.name,
          path: '/create-with-email-and-password-screen',
        ),
        _i47.RouteConfig(
          VerifyPhoneNumber.name,
          path: '/verify-phone-number',
        ),
        _i47.RouteConfig(
          UserNameScreen.name,
          path: '/user-name-screen',
        ),
        _i47.RouteConfig(
          WaitingListFunnelScreen.name,
          path: '/waiting-list-funnel-screen',
          children: [
            _i47.RouteConfig(
              AccountTab.name,
              path: 'account',
              parent: WaitingListFunnelScreen.name,
            )
          ],
        ),
        _i47.RouteConfig(
          RegisterEmailOnBoardingScreen.name,
          path: '/register-email-on-boarding-screen',
        ),
        _i47.RouteConfig(
          RegisterEmailNotificationsScreen.name,
          path: '/register-email-notifications-screen',
        ),
        _i47.RouteConfig(
          CreateWalletFirstOnboardingScreen.name,
          path: '/create-wallet-first-onboarding-screen',
        ),
        _i47.RouteConfig(
          WaitingListSurveyQuestionsScreens.name,
          path: '/waiting-list-survey-questions-screens',
        ),
        _i47.RouteConfig(
          PreLaunchPerksDetailsRoute.name,
          path: '/pre-launch-perks-details-page',
        ),
        _i47.RouteConfig(
          WaitingListPositionInQueueRoute.name,
          path: '/waiting-list-position-in-queue-page',
        ),
        _i47.RouteConfig(
          AddDiscountCodeScreen.name,
          path: '/add-discount-code-screen',
        ),
        _i47.RouteConfig(
          SurveyThanksScreen.name,
          path: '/survey-thanks-screen',
        ),
        _i47.RouteConfig(
          SuggestProductFunnelScreen.name,
          path: '/suggest-product-funnel-screen',
        ),
        _i47.RouteConfig(
          ImageFromGalleryEx.name,
          path: '/image-from-gallery-ex',
        ),
        _i47.RouteConfig(
          ReduxStateViewer.name,
          path: '/redux-state-viewer',
        ),
        _i47.RouteConfig(
          MainScreen.name,
          path: '/main-screen',
          guards: [authGuard],
          children: [
            _i47.RouteConfig(
              VeganHomeTab.name,
              path: 'vegi-home',
              parent: MainScreen.name,
              children: [
                _i47.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: VeganHomeTab.name,
                  redirectTo: 'home',
                  fullMatch: true,
                ),
                _i47.RouteConfig(
                  VeganHomeScreen.name,
                  path: 'home',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  RestaurantMenuScreen.name,
                  path: 'restaurant-menu-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  OrderConfirmedScreen.name,
                  path: 'order-confirmed-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  TopUpScreen.name,
                  path: 'topup-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  AllOrdersPage.name,
                  path: 'all-orders-page',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  ScheduledOrdersPage.name,
                  path: 'scheduled-orders-page',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  FAQScreen.name,
                  path: 'f-aq-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  AboutScreen.name,
                  path: 'about-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  PreparingOrderPage.name,
                  path: 'preparing-order-page',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  CheckoutScreenPt2.name,
                  path: 'checkout-screen-pt2',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  GenerateQRFromCartScreen.name,
                  path: 'generate-qr-from-cart-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  ScanPaymentRecipientQR.name,
                  path: 'scan-payment-recipient-qR',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
                _i47.RouteConfig(
                  ScanProductQRCode.name,
                  path: 'scan-listed-product-qr-code-screen',
                  parent: VeganHomeTab.name,
                  guards: [authGuard],
                ),
              ],
            ),
            _i47.RouteConfig(
              TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i47.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: TopupTab.name,
                  redirectTo: 'topUp',
                  fullMatch: true,
                ),
                _i47.RouteConfig(
                  TopupScreen.name,
                  path: 'topUp',
                  parent: TopupTab.name,
                ),
                _i47.RouteConfig(
                  TopupExplained.name,
                  path: 'topup-explained',
                  parent: TopupTab.name,
                ),
              ],
            ),
          ],
        ),
        _i47.RouteConfig(
          ShowUserMnemonic.name,
          path: '/show-user-mnemonic-screen',
          guards: [authGuard],
        ),
        _i47.RouteConfig(
          VerifyUserMnemonic.name,
          path: '/verify-user-mnemonic',
          guards: [authGuard],
        ),
        _i47.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i47.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({
    _i50.Key? key,
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

  final _i50.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ResetApp]
class ResetApp extends _i47.PageRouteInfo<void> {
  const ResetApp()
      : super(
          ResetApp.name,
          path: '/reset-app',
        );

  static const String name = 'ResetApp';
}

/// generated route for
/// [_i3.ChooseSecurityOption]
class ChooseSecurityOption extends _i47.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(
          ChooseSecurityOption.name,
          path: '/choose-security-option',
        );

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i4.VerifyEmailLinkPage]
class VerifyEmailLinkRoute
    extends _i47.PageRouteInfo<VerifyEmailLinkRouteArgs> {
  VerifyEmailLinkRoute({
    required String emailAddress,
    required String emailLinkFromVerificationEmail,
    _i50.Key? key,
  }) : super(
          VerifyEmailLinkRoute.name,
          path: '/verify-email-link-page',
          args: VerifyEmailLinkRouteArgs(
            emailAddress: emailAddress,
            emailLinkFromVerificationEmail: emailLinkFromVerificationEmail,
            key: key,
          ),
        );

  static const String name = 'VerifyEmailLinkRoute';
}

class VerifyEmailLinkRouteArgs {
  const VerifyEmailLinkRouteArgs({
    required this.emailAddress,
    required this.emailLinkFromVerificationEmail,
    this.key,
  });

  final String emailAddress;

  final String emailLinkFromVerificationEmail;

  final _i50.Key? key;

  @override
  String toString() {
    return 'VerifyEmailLinkRouteArgs{emailAddress: $emailAddress, emailLinkFromVerificationEmail: $emailLinkFromVerificationEmail, key: $key}';
  }
}

/// generated route for
/// [_i5.FirebaseAuthLinkPage]
class FirebaseAuthLinkRoute
    extends _i47.PageRouteInfo<FirebaseAuthLinkRouteArgs> {
  FirebaseAuthLinkRoute({
    String? recaptchaToken,
    String? deepLinkId,
    _i50.Key? key,
  }) : super(
          FirebaseAuthLinkRoute.name,
          path: 'firebaseauth/link',
          args: FirebaseAuthLinkRouteArgs(
            recaptchaToken: recaptchaToken,
            deepLinkId: deepLinkId,
            key: key,
          ),
        );

  static const String name = 'FirebaseAuthLinkRoute';
}

class FirebaseAuthLinkRouteArgs {
  const FirebaseAuthLinkRouteArgs({
    this.recaptchaToken,
    this.deepLinkId,
    this.key,
  });

  final String? recaptchaToken;

  final String? deepLinkId;

  final _i50.Key? key;

  @override
  String toString() {
    return 'FirebaseAuthLinkRouteArgs{recaptchaToken: $recaptchaToken, deepLinkId: $deepLinkId, key: $key}';
  }
}

/// generated route for
/// [_i6.PinCodeScreen]
class PinCodeScreen extends _i47.PageRouteInfo<void> {
  const PinCodeScreen()
      : super(
          PinCodeScreen.name,
          path: '/pin-code-screen',
        );

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i7.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i47.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(
          RestoreFromBackupScreen.name,
          path: '/restore-from-backup-screen',
        );

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i8.OnBoardScreen]
class OnBoardScreen extends _i47.PageRouteInfo<void> {
  const OnBoardScreen({List<_i47.PageRouteInfo>? children})
      : super(
          OnBoardScreen.name,
          path: '/on-board-screen',
          initialChildren: children,
        );

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreen extends _i47.PageRouteInfo<void> {
  const ProfileScreen()
      : super(
          ProfileScreen.name,
          path: '/profile-screen',
        );

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i10.SignUpScreen]
class SignUpScreen extends _i47.PageRouteInfo<void> {
  const SignUpScreen({List<_i47.PageRouteInfo>? children})
      : super(
          SignUpScreen.name,
          path: '/sign-up-screen',
          initialChildren: children,
        );

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i11.SignUpWithEmailAndPasswordScreen]
class SignUpWithEmailAndPasswordScreen extends _i47.PageRouteInfo<void> {
  const SignUpWithEmailAndPasswordScreen({List<_i47.PageRouteInfo>? children})
      : super(
          SignUpWithEmailAndPasswordScreen.name,
          path: '/sign-up-with-email-and-password-screen',
          initialChildren: children,
        );

  static const String name = 'SignUpWithEmailAndPasswordScreen';
}

/// generated route for
/// [_i12.SignUpEmailLinkScreen]
class SignUpEmailLinkScreen extends _i47.PageRouteInfo<void> {
  const SignUpEmailLinkScreen({List<_i47.PageRouteInfo>? children})
      : super(
          SignUpEmailLinkScreen.name,
          path: '/sign-up-email-link-screen',
          initialChildren: children,
        );

  static const String name = 'SignUpEmailLinkScreen';
}

/// generated route for
/// [_i13.SetEmailOnboardingScreen]
class SetEmailOnboardingScreen extends _i47.PageRouteInfo<void> {
  const SetEmailOnboardingScreen()
      : super(
          SetEmailOnboardingScreen.name,
          path: '/set-email-onboarding-screen',
        );

  static const String name = 'SetEmailOnboardingScreen';
}

/// generated route for
/// [_i14.CreateWithEmailAndPasswordScreen]
class CreateWithEmailAndPasswordScreen extends _i47.PageRouteInfo<void> {
  const CreateWithEmailAndPasswordScreen()
      : super(
          CreateWithEmailAndPasswordScreen.name,
          path: '/create-with-email-and-password-screen',
        );

  static const String name = 'CreateWithEmailAndPasswordScreen';
}

/// generated route for
/// [_i15.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i47.PageRouteInfo<VerifyPhoneNumberArgs> {
  VerifyPhoneNumber({
    _i50.Key? key,
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

  final _i50.Key? key;

  final String? verificationId;

  @override
  String toString() {
    return 'VerifyPhoneNumberArgs{key: $key, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i16.UserNameScreen]
class UserNameScreen extends _i47.PageRouteInfo<UserNameScreenArgs> {
  UserNameScreen({_i50.Key? key})
      : super(
          UserNameScreen.name,
          path: '/user-name-screen',
          args: UserNameScreenArgs(key: key),
        );

  static const String name = 'UserNameScreen';
}

class UserNameScreenArgs {
  const UserNameScreenArgs({this.key});

  final _i50.Key? key;

  @override
  String toString() {
    return 'UserNameScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.WaitingListFunnelScreen]
class WaitingListFunnelScreen extends _i47.PageRouteInfo<void> {
  const WaitingListFunnelScreen({List<_i47.PageRouteInfo>? children})
      : super(
          WaitingListFunnelScreen.name,
          path: '/waiting-list-funnel-screen',
          initialChildren: children,
        );

  static const String name = 'WaitingListFunnelScreen';
}

/// generated route for
/// [_i18.RegisterEmailOnBoardingScreen]
class RegisterEmailOnBoardingScreen
    extends _i47.PageRouteInfo<RegisterEmailOnBoardingScreenArgs> {
  RegisterEmailOnBoardingScreen({
    _i50.Key? key,
    void Function()? onSubmitEmail,
  }) : super(
          RegisterEmailOnBoardingScreen.name,
          path: '/register-email-on-boarding-screen',
          args: RegisterEmailOnBoardingScreenArgs(
            key: key,
            onSubmitEmail: onSubmitEmail,
          ),
        );

  static const String name = 'RegisterEmailOnBoardingScreen';
}

class RegisterEmailOnBoardingScreenArgs {
  const RegisterEmailOnBoardingScreenArgs({
    this.key,
    this.onSubmitEmail,
  });

  final _i50.Key? key;

  final void Function()? onSubmitEmail;

  @override
  String toString() {
    return 'RegisterEmailOnBoardingScreenArgs{key: $key, onSubmitEmail: $onSubmitEmail}';
  }
}

/// generated route for
/// [_i19.RegisterEmailNotificationsScreen]
class RegisterEmailNotificationsScreen
    extends _i47.PageRouteInfo<RegisterEmailNotificationsScreenArgs> {
  RegisterEmailNotificationsScreen({
    _i50.Key? key,
    void Function()? onSubmitEmail,
  }) : super(
          RegisterEmailNotificationsScreen.name,
          path: '/register-email-notifications-screen',
          args: RegisterEmailNotificationsScreenArgs(
            key: key,
            onSubmitEmail: onSubmitEmail,
          ),
        );

  static const String name = 'RegisterEmailNotificationsScreen';
}

class RegisterEmailNotificationsScreenArgs {
  const RegisterEmailNotificationsScreenArgs({
    this.key,
    this.onSubmitEmail,
  });

  final _i50.Key? key;

  final void Function()? onSubmitEmail;

  @override
  String toString() {
    return 'RegisterEmailNotificationsScreenArgs{key: $key, onSubmitEmail: $onSubmitEmail}';
  }
}

/// generated route for
/// [_i20.CreateWalletFirstOnboardingScreen]
class CreateWalletFirstOnboardingScreen extends _i47.PageRouteInfo<void> {
  const CreateWalletFirstOnboardingScreen()
      : super(
          CreateWalletFirstOnboardingScreen.name,
          path: '/create-wallet-first-onboarding-screen',
        );

  static const String name = 'CreateWalletFirstOnboardingScreen';
}

/// generated route for
/// [_i21.WaitingListSurveyQuestionsScreens]
class WaitingListSurveyQuestionsScreens
    extends _i47.PageRouteInfo<WaitingListSurveyQuestionsScreensArgs> {
  WaitingListSurveyQuestionsScreens({
    _i50.Key? key,
    required bool surveyCompleted,
  }) : super(
          WaitingListSurveyQuestionsScreens.name,
          path: '/waiting-list-survey-questions-screens',
          args: WaitingListSurveyQuestionsScreensArgs(
            key: key,
            surveyCompleted: surveyCompleted,
          ),
        );

  static const String name = 'WaitingListSurveyQuestionsScreens';
}

class WaitingListSurveyQuestionsScreensArgs {
  const WaitingListSurveyQuestionsScreensArgs({
    this.key,
    required this.surveyCompleted,
  });

  final _i50.Key? key;

  final bool surveyCompleted;

  @override
  String toString() {
    return 'WaitingListSurveyQuestionsScreensArgs{key: $key, surveyCompleted: $surveyCompleted}';
  }
}

/// generated route for
/// [_i22.PreLaunchPerksDetailsPage]
class PreLaunchPerksDetailsRoute extends _i47.PageRouteInfo<void> {
  const PreLaunchPerksDetailsRoute()
      : super(
          PreLaunchPerksDetailsRoute.name,
          path: '/pre-launch-perks-details-page',
        );

  static const String name = 'PreLaunchPerksDetailsRoute';
}

/// generated route for
/// [_i23.WaitingListPositionInQueuePage]
class WaitingListPositionInQueueRoute extends _i47.PageRouteInfo<void> {
  const WaitingListPositionInQueueRoute()
      : super(
          WaitingListPositionInQueueRoute.name,
          path: '/waiting-list-position-in-queue-page',
        );

  static const String name = 'WaitingListPositionInQueueRoute';
}

/// generated route for
/// [_i24.AddDiscountCodeScreen]
class AddDiscountCodeScreen
    extends _i47.PageRouteInfo<AddDiscountCodeScreenArgs> {
  AddDiscountCodeScreen({
    _i50.Key? key,
    required void Function() onVerifyDiscountCode,
  }) : super(
          AddDiscountCodeScreen.name,
          path: '/add-discount-code-screen',
          args: AddDiscountCodeScreenArgs(
            key: key,
            onVerifyDiscountCode: onVerifyDiscountCode,
          ),
        );

  static const String name = 'AddDiscountCodeScreen';
}

class AddDiscountCodeScreenArgs {
  const AddDiscountCodeScreenArgs({
    this.key,
    required this.onVerifyDiscountCode,
  });

  final _i50.Key? key;

  final void Function() onVerifyDiscountCode;

  @override
  String toString() {
    return 'AddDiscountCodeScreenArgs{key: $key, onVerifyDiscountCode: $onVerifyDiscountCode}';
  }
}

/// generated route for
/// [_i25.SurveyThanksScreen]
class SurveyThanksScreen extends _i47.PageRouteInfo<void> {
  const SurveyThanksScreen()
      : super(
          SurveyThanksScreen.name,
          path: '/survey-thanks-screen',
        );

  static const String name = 'SurveyThanksScreen';
}

/// generated route for
/// [_i26.SuggestProductFunnelScreen]
class SuggestProductFunnelScreen
    extends _i47.PageRouteInfo<SuggestProductFunnelScreenArgs> {
  SuggestProductFunnelScreen({
    _i50.Key? key,
    String? scannedQRCode,
  }) : super(
          SuggestProductFunnelScreen.name,
          path: '/suggest-product-funnel-screen',
          args: SuggestProductFunnelScreenArgs(
            key: key,
            scannedQRCode: scannedQRCode,
          ),
        );

  static const String name = 'SuggestProductFunnelScreen';
}

class SuggestProductFunnelScreenArgs {
  const SuggestProductFunnelScreenArgs({
    this.key,
    this.scannedQRCode,
  });

  final _i50.Key? key;

  final String? scannedQRCode;

  @override
  String toString() {
    return 'SuggestProductFunnelScreenArgs{key: $key, scannedQRCode: $scannedQRCode}';
  }
}

/// generated route for
/// [_i27.ImageFromGalleryEx]
class ImageFromGalleryEx extends _i47.PageRouteInfo<ImageFromGalleryExArgs> {
  ImageFromGalleryEx({
    required _i51.ImageSourceType type,
    _i50.Key? key,
    required void Function(_i52.File?) handleImagePicked,
  }) : super(
          ImageFromGalleryEx.name,
          path: '/image-from-gallery-ex',
          args: ImageFromGalleryExArgs(
            type: type,
            key: key,
            handleImagePicked: handleImagePicked,
          ),
        );

  static const String name = 'ImageFromGalleryEx';
}

class ImageFromGalleryExArgs {
  const ImageFromGalleryExArgs({
    required this.type,
    this.key,
    required this.handleImagePicked,
  });

  final _i51.ImageSourceType type;

  final _i50.Key? key;

  final void Function(_i52.File?) handleImagePicked;

  @override
  String toString() {
    return 'ImageFromGalleryExArgs{type: $type, key: $key, handleImagePicked: $handleImagePicked}';
  }
}

/// generated route for
/// [_i28.ReduxStateViewer]
class ReduxStateViewer extends _i47.PageRouteInfo<ReduxStateViewerArgs> {
  ReduxStateViewer({
    required _i53.DevToolsStore<_i54.AppState> store,
    _i50.Key? key,
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

  final _i53.DevToolsStore<_i54.AppState> store;

  final _i50.Key? key;

  final int actionMaxLines;

  final int stateMaxLines;

  @override
  String toString() {
    return 'ReduxStateViewerArgs{store: $store, key: $key, actionMaxLines: $actionMaxLines, stateMaxLines: $stateMaxLines}';
  }
}

/// generated route for
/// [_i29.MainScreen]
class MainScreen extends _i47.PageRouteInfo<void> {
  const MainScreen({List<_i47.PageRouteInfo>? children})
      : super(
          MainScreen.name,
          path: '/main-screen',
          initialChildren: children,
        );

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i30.ShowUserMnemonicScreen]
class ShowUserMnemonic extends _i47.PageRouteInfo<void> {
  const ShowUserMnemonic()
      : super(
          ShowUserMnemonic.name,
          path: '/show-user-mnemonic-screen',
        );

  static const String name = 'ShowUserMnemonic';
}

/// generated route for
/// [_i31.VerifyUserMnemonic]
class VerifyUserMnemonic extends _i47.PageRouteInfo<void> {
  const VerifyUserMnemonic()
      : super(
          VerifyUserMnemonic.name,
          path: '/verify-user-mnemonic',
        );

  static const String name = 'VerifyUserMnemonic';
}

/// generated route for
/// [_i32.EmptyRouterPage]
class AccountTab extends _i47.PageRouteInfo<void> {
  const AccountTab()
      : super(
          AccountTab.name,
          path: 'account',
        );

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i32.EmptyRouterPage]
class VeganHomeTab extends _i47.PageRouteInfo<void> {
  const VeganHomeTab({List<_i47.PageRouteInfo>? children})
      : super(
          VeganHomeTab.name,
          path: 'vegi-home',
          initialChildren: children,
        );

  static const String name = 'VeganHomeTab';
}

/// generated route for
/// [_i32.EmptyRouterPage]
class TopupTab extends _i47.PageRouteInfo<void> {
  const TopupTab({List<_i47.PageRouteInfo>? children})
      : super(
          TopupTab.name,
          path: 'topup',
          initialChildren: children,
        );

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i33.VeganHomeScreen]
class VeganHomeScreen extends _i47.PageRouteInfo<void> {
  const VeganHomeScreen()
      : super(
          VeganHomeScreen.name,
          path: 'home',
        );

  static const String name = 'VeganHomeScreen';
}

/// generated route for
/// [_i34.RestaurantMenuScreen]
class RestaurantMenuScreen extends _i47.PageRouteInfo<void> {
  const RestaurantMenuScreen()
      : super(
          RestaurantMenuScreen.name,
          path: 'restaurant-menu-screen',
        );

  static const String name = 'RestaurantMenuScreen';
}

/// generated route for
/// [_i35.OrderConfirmedScreen]
class OrderConfirmedScreen extends _i47.PageRouteInfo<void> {
  const OrderConfirmedScreen()
      : super(
          OrderConfirmedScreen.name,
          path: 'order-confirmed-screen',
        );

  static const String name = 'OrderConfirmedScreen';
}

/// generated route for
/// [_i36.TopupScreen]
class TopUpScreen extends _i47.PageRouteInfo<void> {
  const TopUpScreen()
      : super(
          TopUpScreen.name,
          path: 'topup-screen',
        );

  static const String name = 'TopUpScreen';
}

/// generated route for
/// [_i37.AllOrdersPage]
class AllOrdersPage extends _i47.PageRouteInfo<void> {
  const AllOrdersPage()
      : super(
          AllOrdersPage.name,
          path: 'all-orders-page',
        );

  static const String name = 'AllOrdersPage';
}

/// generated route for
/// [_i38.ScheduledOrdersPage]
class ScheduledOrdersPage extends _i47.PageRouteInfo<void> {
  const ScheduledOrdersPage()
      : super(
          ScheduledOrdersPage.name,
          path: 'scheduled-orders-page',
        );

  static const String name = 'ScheduledOrdersPage';
}

/// generated route for
/// [_i39.FAQScreen]
class FAQScreen extends _i47.PageRouteInfo<void> {
  const FAQScreen()
      : super(
          FAQScreen.name,
          path: 'f-aq-screen',
        );

  static const String name = 'FAQScreen';
}

/// generated route for
/// [_i40.AboutScreen]
class AboutScreen extends _i47.PageRouteInfo<void> {
  const AboutScreen()
      : super(
          AboutScreen.name,
          path: 'about-screen',
        );

  static const String name = 'AboutScreen';
}

/// generated route for
/// [_i41.PreparingOrderPage]
class PreparingOrderPage extends _i47.PageRouteInfo<PreparingOrderPageArgs> {
  PreparingOrderPage({
    _i50.Key? key,
    required _i55.Order order,
  }) : super(
          PreparingOrderPage.name,
          path: 'preparing-order-page',
          args: PreparingOrderPageArgs(
            key: key,
            order: order,
          ),
        );

  static const String name = 'PreparingOrderPage';
}

class PreparingOrderPageArgs {
  const PreparingOrderPageArgs({
    this.key,
    required this.order,
  });

  final _i50.Key? key;

  final _i55.Order order;

  @override
  String toString() {
    return 'PreparingOrderPageArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i42.CheckoutScreenPt2]
class CheckoutScreenPt2 extends _i47.PageRouteInfo<void> {
  const CheckoutScreenPt2()
      : super(
          CheckoutScreenPt2.name,
          path: 'checkout-screen-pt2',
        );

  static const String name = 'CheckoutScreenPt2';
}

/// generated route for
/// [_i43.GenerateQRFromCartScreen]
class GenerateQRFromCartScreen extends _i47.PageRouteInfo<void> {
  const GenerateQRFromCartScreen()
      : super(
          GenerateQRFromCartScreen.name,
          path: 'generate-qr-from-cart-screen',
        );

  static const String name = 'GenerateQRFromCartScreen';
}

/// generated route for
/// [_i44.ScanPaymentRecipientQR]
class ScanPaymentRecipientQR extends _i47.PageRouteInfo<void> {
  const ScanPaymentRecipientQR()
      : super(
          ScanPaymentRecipientQR.name,
          path: 'scan-payment-recipient-qR',
        );

  static const String name = 'ScanPaymentRecipientQR';
}

/// generated route for
/// [_i45.ScanListedProductQRCodeScreen]
class ScanProductQRCode extends _i47.PageRouteInfo<void> {
  const ScanProductQRCode()
      : super(
          ScanProductQRCode.name,
          path: 'scan-listed-product-qr-code-screen',
        );

  static const String name = 'ScanProductQRCode';
}

/// generated route for
/// [_i36.TopupScreen]
class TopupScreen extends _i47.PageRouteInfo<void> {
  const TopupScreen()
      : super(
          TopupScreen.name,
          path: 'topUp',
        );

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i46.TopupExplained]
class TopupExplained extends _i47.PageRouteInfo<void> {
  const TopupExplained()
      : super(
          TopupExplained.name,
          path: 'topup-explained',
        );

  static const String name = 'TopupExplained';
}
