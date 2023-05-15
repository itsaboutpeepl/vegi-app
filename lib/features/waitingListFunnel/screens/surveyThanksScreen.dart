import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/onboard/widgets/sign_up_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/address_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/bill_invoice_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_items_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/thanks_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/logoutDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/widgets/surveyCompletedCard.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/view_item.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/orderConfirmed.dart';
import 'package:vegan_liverpool/redux/viewsmodels/survey_thanks.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SurveyThanksScreen extends StatefulWidget {
  const SurveyThanksScreen({Key? key}) : super(key: key);

  @override
  State<SurveyThanksScreen> createState() => _SurveyThanksScreenState();
}

class _SurveyThanksScreenState extends State<SurveyThanksScreen> {
  bool isPrimaryPreloading = false;

  Future<void> Function() _viewAccount(
    BuildContext context,
    SurveyThanksViewModel viewmodel,
  ) {
    return () async {
      unawaited(Analytics.track(eventName: AnalyticsEvents.viewAccount));
      if (isPrimaryPreloading) {
        return;
      }
      await context.router.push(const ProfileScreen());
    };
  }

  Future<void> Function() _logout(
    BuildContext context,
    SurveyThanksViewModel viewmodel,
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

  Future<void> Function() _signUpNewAccount(
    BuildContext context,
    SurveyThanksViewModel viewmodel,
  ) {
    return () async {
      if (isPrimaryPreloading) {
        return;
      }
      if (viewmodel.isLoggedOut) {
        viewmodel.loginAgain();
        if (context.router.canPop()) {
          context.router.popUntilRoot();
        }
        await context.router.replace(const MainScreen());
      } else {
        // setState(() {
        //   isPrimaryPreloading = true;
        // });
        viewmodel.createLocalAccount(
          () {
            setState(() {
              isPrimaryPreloading = false;
            });
            log.info('Push SignUpScreen()');
            context.router.push(const SignUpScreen());
          },
        );
      }
    };
  }

  Future<void> Function() _restoreBackupWallet(
    BuildContext context,
    SurveyThanksViewModel viewmodel,
  ) {
    return () async {
      // if (isPrimaryPreloading) {
      //   return;
      // }
      await context.router.push(const RestoreFromBackupScreen());
    };
  }

  Future<void> Function() _createAccount(
    BuildContext context,
    SurveyThanksViewModel viewmodel,
  ) {
    return () async {
      // if (isPrimaryPreloading) {
      //   return;
      // }
      setState(() {
        isPrimaryPreloading = true;
      });
      viewmodel.createLocalAccount(
        () {
          setState(() {
            isPrimaryPreloading = false;
          });
          log.info('Push SignUpScreen()');
          context.router.push(const SignUpScreen());
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SurveyThanksViewModel>(
      converter: SurveyThanksViewModel.fromStore,
      distinct: true,
      onInit: (store) => store.dispatch(CreateSurveyCompletedSuccess(true)),
      onWillChange: (previousViewModel, newViewModel) async {
        checkAuth(
          oldViewModel: previousViewModel,
          newViewModel: newViewModel,
          routerContext: context,
        );
      },
      builder: (_, viewmodel) {
        return Scaffold(
          backgroundColor: themeShade1100,
          body: Padding(
            padding: EdgeInsets.only(
              bottom: 30,
              top: MediaQuery.of(context).size.height * 0.08,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SurveyCompletedCard(),
                if (viewmodel.accountCreated) ...[
                  SignUpButton(
                    buttonText: Labels.signupButtonLabelViewAccount,
                    onPressed: _viewAccount(context, viewmodel),
                    isLoading: isPrimaryPreloading,
                  ),
                  SignUpButton(
                    buttonText: Labels.signupButtonLabelLogout(context),
                    onPressed: _logout(context, viewmodel),
                    isLoading: isPrimaryPreloading,
                  ),
                ] else ...[
                  SignUpButton(
                    autoSizeText: true,
                    buttonText: Labels.signupButtonLabelCreateAccount,
                    onPressed: _createAccount(context, viewmodel),
                    isLoading: isPrimaryPreloading,
                  ),
                  SignUpButton(
                    autoSizeText: true,
                    buttonText:
                        Labels.surveyThanksButtonRestoreBackupWallet(context),
                    onPressed: _restoreBackupWallet(context, viewmodel),
                    //! Replace with below after beta
                    //! onPressed: _signUpNewAccount(context, viewmodel),
                    isLoading: isPrimaryPreloading,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
