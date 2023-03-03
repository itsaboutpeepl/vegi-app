import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/address_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/bill_invoice_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_items_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/thanks_card.dart';
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

class SurveyThanksScreen extends StatefulWidget {
  const SurveyThanksScreen({Key? key}) : super(key: key);

  @override
  State<SurveyThanksScreen> createState() => _SurveyThanksScreenState();
}

class _SurveyThanksScreenState extends State<SurveyThanksScreen> {
  bool isPrimaryPreloading = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SurveyThanksViewModel>(
      converter: SurveyThanksViewModel.fromStore,
      distinct: true,
      // onInit: (store) => store.dispatch(isBetaWhitelistedAddress()),
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
                // const SizedBox(height: 20,),
                // Create Account Button
                if (viewmodel.accountCreated) ...[
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.grey[100]!,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'View account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[100],
                      ),
                    ),
                    onPressed: () {
                      Analytics.track(eventName: AnalyticsEvents.viewAccount);
                      final router = AutoRouter.of(context);
                      context.router.push(const ProfileScreen());
                    },
                  ),
                  if (kDebugMode)
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.grey[100]!,
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey[100],
                        ),
                      ),
                      onPressed: () {
                        viewmodel.logout();
                        context.router.replace(const OnBoardScreen());
                        Analytics.track(eventName: AnalyticsEvents.logout);
                      },
                    ),
                ] else ...[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      top: 0,
                    ),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.grey[100]!,
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // child: Text(
                      //   'Create Account',
                      //   // I10n.of(context).restore_from_backup,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w800,
                      //     color: Colors.grey[100],
                      //   ),
                      // ),
                      child: Material(
                        color: Colors.transparent,
                        child: Center(
                          child: !isPrimaryPreloading
                              ? AutoSizeText(
                                  'Create Account',
                                  style: TextStyle(
                                    color: isPrimaryPreloading
                                        ? const Color(0xFF797979)
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  maxLines: 1,
                                )
                              : Container(
                                  width: 21,
                                  height: 21,
                                  margin: const EdgeInsets.only(
                                    left: 28,
                                    right: 28,
                                  ),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).canvasColor,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      onPressed: () {
                        if (isPrimaryPreloading) {
                          return;
                        }
                        // ! after beta, uncomment ->
                        // //TODO: make this readable PLEASE
                        setState(() {
                          isPrimaryPreloading = true;
                        });
                        viewmodel.createLocalAccount(
                          () {
                            setState(() {
                              isPrimaryPreloading = false;
                            });
                            context.router.push(const SignUpScreen());
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      top: 0,
                    ),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.grey[100]!,
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // child: Text(
                      //   I10n.of(context).restore_from_backup,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w800,
                      //     color: Colors.grey[100],
                      //   ),
                      // ),
                      child: Material(
                        color: Colors.transparent,
                        child: Center(
                          child: !isPrimaryPreloading
                              ? AutoSizeText(
                                  I10n.of(context).restore_from_backup,
                                  style: TextStyle(
                                    color: isPrimaryPreloading
                                        ? const Color(0xFF797979)
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  maxLines: 1,
                                )
                              : Container(
                                  width: 21,
                                  height: 21,
                                  margin: const EdgeInsets.only(
                                    left: 28,
                                    right: 28,
                                  ),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).canvasColor,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      onPressed: () {
                        if (isPrimaryPreloading) {
                          return;
                        }
                        // ! after beta, uncomment ->
                        // //TODO: make this readable PLEASE
                        // if (viewmodel.isLoggedOut) {
                        //   viewmodel.loginAgain();
                        //   if (context.router.canPop()) {
                        //     context.router.popUntilRoot();
                        //   }
                        //   context.router.replace(const MainScreen());
                        // } else {
                        //   setState(() {
                        //     isPrimaryPreloading = true;
                        //   });
                        //   viewmodel.createLocalAccount(
                        //     () {
                        //       setState(() {
                        //         isPrimaryPreloading = false;
                        //       });
                        //       context.router.push(const SignUpScreen());
                        //     },
                        //   );
                        // }
                        context.router.push(const RestoreFromBackupScreen());
                      },
                    ),
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
