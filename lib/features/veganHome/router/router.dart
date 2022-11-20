import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/account/screens/profile.dart';
import 'package:vegan_liverpool/features/onboard/screens/show_user_mnemonic.dart';
import 'package:vegan_liverpool/features/onboard/screens/verify_user_mnemonic.dart';
import 'package:vegan_liverpool/features/pay/screens/generate_QR_from_cart.dart';
import 'package:vegan_liverpool/features/pay/screens/scan_payment_recipient_qr.dart';
import 'package:vegan_liverpool/features/topup/screens/topup.dart';
import 'package:vegan_liverpool/features/veganHome/screens/aboutScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/allOrdersPage.dart';
import 'package:vegan_liverpool/features/veganHome/screens/checkout_screen_2.dart';
import 'package:vegan_liverpool/features/veganHome/screens/faqScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/orderConfirmed.dart';
import 'package:vegan_liverpool/features/veganHome/screens/preparingOrderScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/restaurantMenuScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/scheduledOrdersPage.dart';
import 'package:vegan_liverpool/features/veganHome/screens/veganHome.dart';

const veganHomeTab = AutoRoute(
  path: 'veganHomeAlt',
  name: 'veganHomeAltTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: VeganHomeScreen,
      name: 'veganHomeScreenAlt',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: RestaurantMenuScreen,
      name: 'restaurantMenuScreen',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: OrderConfirmedScreen,
      name: 'orderConfirmedScreen',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    AutoRoute(
      page: ProfileScreen,
      name: 'ProfileScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: TopupScreen,
      name: 'TopUpScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: AllOrdersPage,
      name: 'AllOrdersPage',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ScheduledOrdersPage,
      name: 'ScheduledOrdersPage',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: FAQScreen,
      name: 'FAQScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: AboutScreen,
      name: 'aboutScreen',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: PreparingOrderPage,
      name: 'PreparingOrderPage',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    AutoRoute(
      page: ShowUserMnemonicScreen,
      name: 'showUserMnemonic',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: VerifyUserMnemonic,
      name: 'verifyUserMnemonic',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: CheckoutScreenPt2,
      name: 'checkoutScreenPt2',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: GenerateQRFromCart,
      name: 'generateQRFromCart',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ScanPaymentRecipientQR,
      name: 'scanPaymentRecipientQR',
      guards: [AuthGuard],
    ),
  ],
);
