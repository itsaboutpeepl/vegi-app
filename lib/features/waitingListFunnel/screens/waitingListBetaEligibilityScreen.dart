import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/analytics_props.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/arrowButton.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListBetaEligibilityButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/waitingListFunnel/waitingListPositionInQueueViewModel.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/config.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class WaitingListBetaEligibilityScreen extends StatelessWidget {
  const WaitingListBetaEligibilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WaitinglistPositionInQueueViewModel>(
      converter: WaitinglistPositionInQueueViewModel.fromStore,
      onInit: (store) {
        if (store.state.userState.userIsVerified) {
          rootRouter.replaceAll([const MainScreen()]);
          return;
        }
      },
      builder: (context, viewModel) {
        const queueTextSize = 48.0;
        if (viewModel.userIsVerified) {
          rootRouter.replaceAll([const MainScreen()]);
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    ImagePaths.onboardingPage5Background,
                  ),
                ),
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   // color: Colors.blue,
                //   alignment: Alignment.centerRight,
                //   child: Image.asset(
                //     ImagePaths.vegiBeanManNSEW,
                //     width: MediaQuery.of(context).size.width * 0.75,
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.225,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'You\'re',
                                style: TextStyle(
                                  color: themeShade1000,
                                ),
                              ),
                              TextSpan(
                                text: ' eligible ',
                                style: TextStyle(
                                  color: themeShade650,
                                ),
                              ),
                              TextSpan(
                                text: 'for our pre-launch perks',
                                style: TextStyle(
                                  color: themeShade1000,
                                ),
                              ),
                            ],
                          ),
                          minFontSize: 16,
                          maxFontSize: 80,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 60,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      WaitingListBetaEligibilityButton(
                        title: 'Early bird access',
                        textLines: const [
                          'Join our beta app to use',
                          'vegi now!',
                        ],
                        onPressed: () => rootRouter.replace(
                          viewModel.accountCreated
                              ? const MainScreen()
                              : const CreateWalletFirstOnboardingScreen(),
                        ),
                        imagePath: ImagePaths.onboardingPage5Card,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      WaitingListBetaEligibilityButton(
                        title: 'Wait for launch',
                        textLines: const [
                          'Get notified when we are ready.',
                          'Your vouchers will still be valid!',
                        ],
                        onPressed: () => rootRouter.replace(
                          RegisterEmailNotificationsScreen(
                            onSubmitEmail: () {
                              viewModel.subscribeToWaitingListEmails(
                                receiveNotifications: true,
                                onError: (errStr) => showErrorSnack(
                                  context: context,
                                  title: Messages
                                      .unableToRegisterEmailForNotifications,
                                ),
                              );
                            }, // Register User For Email Notifications and
                          ),
                        ),
                        imagePath: ImagePaths.onboardingPage5CardSnail,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
