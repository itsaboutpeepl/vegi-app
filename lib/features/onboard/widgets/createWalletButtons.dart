import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/onboard/dialogs/warn_before_recreate.dart';
import 'package:vegan_liverpool/features/onboard/widgets/sign_up_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/shared/widgets/transparent_button.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/logoutDialog.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/splash.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class CreateWalletButtons extends StatefulWidget {
  const CreateWalletButtons({Key? key}) : super(key: key);

  @override
  State<CreateWalletButtons> createState() => _CreateWalletButtonsState();
}

class _CreateWalletButtonsState extends State<CreateWalletButtons> {
  bool isPrimaryPreloading = false;
  bool isTransparentPreloading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SplashViewModel>(
      distinct: true,
      converter: SplashViewModel.fromStore,
      // onWillChange: (previousViewModel, newViewModel) async {
      //   final checked = checkAuth(
      //     oldViewModel: previousViewModel,
      //     newViewModel: newViewModel,
      //     routerContext: context,
      //   );
      //   await checked.runNavigationIfNeeded();
      // },
      onInit: (store) {
        store.dispatch(fetchSurveyQuestions());
        if (store.state.userState.accountDetailsExist) {
          store.dispatch(isBetaWhitelistedAddress());
          // ..dispatch(ReLogin());
        }
      },
      builder: (_, viewmodel) {
        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Image.asset(
                      'assets/images/Vegi-Logo-horizontal.png',
                      width: 350,
                      height: 250,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Text(
                      Labels.signupScreenTitle(
                        isWhiteListedAccount: viewmodel.isWhiteListedAccount,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                      ),
                    ),
                  ),
                  if (viewmodel.surveyCompleted)
                    SizedBox(
                      height: 64,
                      child: Text(
                        Labels.signupScreenSubTitle(
                          isWhiteListedAccount: viewmodel.isWhiteListedAccount,
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        if (viewmodel.accountCreated) ...[
                          SignUpButton(
                            buttonText: Labels.signupButtonLabelViewAccount,
                            onPressed: _viewAccount(context, viewmodel),
                            isLoading: isPrimaryPreloading,
                            borderColor: themeShade1000,
                            textColor: themeShade850,
                            textLoadingColor: themeLightShade1000,
                          ),
                          SignUpButton(
                            buttonText: Labels.signupButtonLabelLogout(context),
                            onPressed: _logout(context, viewmodel),
                            isLoading: isPrimaryPreloading,
                            borderColor: themeShade1000,
                            textColor: themeShade850,
                            textLoadingColor: themeLightShade1000,
                          ),
                        ] else ...[
                          SignUpButton(
                            autoSizeText: true,
                            buttonText: Labels.signupButtonLabelCreateAccount,
                            onPressed: _createAccount(context, viewmodel),
                            isLoading: isPrimaryPreloading,
                            borderColor: themeShade1000,
                            textColor: themeShade850,
                            textLoadingColor: themeLightShade1000,
                          ),
                          SignUpButton(
                            autoSizeText: true,
                            buttonText:
                                Labels.surveyThanksButtonRestoreBackupWallet(
                              context,
                            ),
                            onPressed: _restoreBackupWallet(context, viewmodel),
                            //! Replace with below after beta
                            //! onPressed: _signUpNewAccount(context, viewmodel),
                            isLoading: isPrimaryPreloading,
                            borderColor: themeShade1000,
                            textColor: themeShade850,
                            textLoadingColor: themeLightShade1000,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> Function() _viewAccount(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.viewAccount,
        ),
      );
      unawaited(
        context.router.push(
          const ProfileScreen(),
        ),
      );
    };
  }

  Future<void> Function() _signUpNewAccount(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      final bool? result = await showDialog<bool>(
        context: context,
        builder: (context) => const WarnBeforeReCreation(),
      );
      if (result!) {
        setState(() {
          isTransparentPreloading = true;
        });
        viewmodel.initFuse();
      }
    };
  }

  Future<void> Function() _signUpNewAccountOnWaitlist(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      // if (viewmodel.surveyCompleted) {
      //   if (context.router.canPop()) {
      //     context.router.popUntilRoot();
      //   }
      //   await context.router.replace(
      //     WaitingListFunnelScreen(
      //       surveyCompleted: true,
      //     ),
      //   );
      // } else {
      //   await context.router.replace(
      //     WaitingListFunnelScreen(
      //       surveyCompleted: false,
      //     ),
      //   );
      // }
      if (showWaitingListFunnel) {
        await rootRouter.replace(const WaitingListFunnelScreen());
      } else {
        await rootRouter.replace(const MainScreen());
      }
    };
  }

  Future<void> Function() _createAccount(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      if (isPrimaryPreloading) {
        return;
      }
      setState(() {
        isPrimaryPreloading = true;
      });
      viewmodel.initFuse();
    };
  }

  Future<void> Function() _resetSurvey(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      viewmodel.resetSurveyCompleted();
      await rootRouter.replace(
        const WaitingListFunnelScreen(),
      );
    };
  }

  Future<void> Function() _reLogin(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      viewmodel.initFuse();
    };
  }

  Future<void> Function() _logout(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      // if (isPrimaryPreloading) {
      //   return;
      // }
      await showDialog<Widget>(
        context: context,
        builder: (context) => const LogoutDialog(),
      );
    };
  }

  Future<void> Function() _restoreBackupWallet(
    BuildContext context,
    SplashViewModel viewmodel,
  ) {
    return () async {
      await context.router.push(const RestoreFromBackupScreen());
    };
  }
}
