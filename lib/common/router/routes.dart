import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/account/router/router.dart';
import 'package:vegan_liverpool/features/onboard/screens/restore_wallet_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/security_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/signup_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/username_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/verify_screen.dart';
import 'package:vegan_liverpool/features/screens/main_screen.dart';
import 'package:vegan_liverpool/features/screens/on_board_screen.dart';
import 'package:vegan_liverpool/features/screens/pincode_screen.dart';
import 'package:vegan_liverpool/features/screens/splash_screen.dart';
import 'package:vegan_liverpool/features/topup/router/topup_router.dart';
import 'package:vegan_liverpool/features/veganHome/router/router.dart';
import 'package:vegan_liverpool/features/veganHome/screens/suggestProductFunnel.dart';
import 'package:vegan_liverpool/features/veganHome/screens/imageFromGalleryEx.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/redux_state_viewer.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/registerEmailWaitingList.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/surveyQuestionScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListFunnel.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: ChooseSecurityOption),
    AutoRoute(page: PinCodeScreen),
    AutoRoute(page: RestoreFromBackupScreen),
    AutoRoute(page: OnBoardScreen),
    AutoRoute(page: SignUpScreen),
    AutoRoute(page: VerifyPhoneNumber),
    AutoRoute(page: UserNameScreen),
    AutoRoute(page: WaitingListFunnelScreen),
    AutoRoute(page: SuggestProductFunnelScreen),
    AutoRoute(page: ImageFromGalleryEx),
    if (kDebugMode) AutoRoute(page: ReduxStateViewer),
    AutoRoute(
      page: MainScreen,
      guards: [AuthGuard],
      children: [
        veganHomeTab,
        topupTab,
        accountTab,
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $RootRouter {}
