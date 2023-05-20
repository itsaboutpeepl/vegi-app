import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/account/router/router.dart';
import 'package:vegan_liverpool/features/account/screens/profile.dart';
import 'package:vegan_liverpool/features/onboard/screens/createWalletFirstScreen.dart';
import 'package:vegan_liverpool/features/onboard/screens/firebaseAuthLink.dart';
import 'package:vegan_liverpool/features/onboard/screens/registerEmailOnboardingScreen.dart';
import 'package:vegan_liverpool/features/onboard/screens/restore_wallet_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/security_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/show_user_mnemonic.dart';
import 'package:vegan_liverpool/features/onboard/screens/signup_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/username_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/verifyEmailLink.dart';
import 'package:vegan_liverpool/features/onboard/screens/verify_screen.dart';
import 'package:vegan_liverpool/features/onboard/screens/verify_user_mnemonic.dart';
import 'package:vegan_liverpool/features/screens/main_screen.dart';
import 'package:vegan_liverpool/features/screens/on_board_screen.dart';
import 'package:vegan_liverpool/features/screens/pincode_screen.dart';
import 'package:vegan_liverpool/features/screens/splash_screen.dart';
import 'package:vegan_liverpool/features/topup/router/topup_router.dart';
import 'package:vegan_liverpool/features/veganHome/router/router.dart';
import 'package:vegan_liverpool/features/veganHome/screens/suggestProductFunnel.dart';
import 'package:vegan_liverpool/features/veganHome/screens/imageFromGalleryEx.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/redux_state_viewer.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/addDiscountCodeScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/preLaunchPerksDetailsPage.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/registerEmailNotificationsScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/surveyQuestionScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/surveyThanksScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListFunnel.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListPositionInQueuePage.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListSurveyQuestions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/reset_app.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: ResetApp),
    AutoRoute(page: ChooseSecurityOption),
    AutoRoute(page: VerifyEmailLinkPage),
    AutoRoute(
      page: FirebaseAuthLinkPage, 
      path: 'firebaseauth/link',
    ),
    AutoRoute(page: PinCodeScreen),
    AutoRoute(
      page: RestoreFromBackupScreen,
    ),
    AutoRoute(
      page: OnBoardScreen,
      children: [
        accountTab,
      ],
    ),
    AutoRoute(
      page: ProfileScreen,
    ),
    AutoRoute(
      page: SignUpScreen,
      children: [
        accountTab,
      ],
    ),
    AutoRoute(page: VerifyPhoneNumber),
    AutoRoute(page: UserNameScreen),
    AutoRoute(
      page: WaitingListFunnelScreen,
      children: [
        accountTab,
      ],
    ),
    AutoRoute(page: RegisterEmailOnBoardingScreen),
    AutoRoute(page: RegisterEmailNotificationsScreen),
    AutoRoute(page: CreateWalletFirstOnboardingScreen),
    AutoRoute(page: WaitingListSurveyQuestionsScreens),
    AutoRoute(page: PreLaunchPerksDetailsPage),
    AutoRoute(page: WaitingListPositionInQueuePage),
    AutoRoute(page: AddDiscountCodeScreen),
    AutoRoute(page: SurveyThanksScreen),
    AutoRoute(page: SuggestProductFunnelScreen),
    AutoRoute(page: ImageFromGalleryEx),
    if (kDebugMode) AutoRoute(page: ReduxStateViewer),
    AutoRoute(
      page: MainScreen, //path: main-screen/
      guards: [AuthGuard],
      children: [
        veganHomeTab,
        topupTab,
        // accountTab,
      ],
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
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $RootRouter {}
