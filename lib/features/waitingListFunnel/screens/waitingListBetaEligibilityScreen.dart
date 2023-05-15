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
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.blue,
                alignment: Alignment.centerRight,
                child: Image.asset(
                  ImagePaths.vegiBeanManNSEW,
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'You',
                              style: TextStyle(
                                color: Colors.grey[850],
                              ),
                            ),
                            const TextSpan(
                              text: ' are ',
                              style: TextStyle(
                                color: themeShade850,
                              ),
                            ),
                            TextSpan(
                              text: 'eligible for our pre-launch perks',
                              style: TextStyle(
                                color: Colors.grey[850],
                              ),
                            ),
                          ],
                        ),
                        minFontSize: 16,
                        maxFontSize: 80,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 60,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        // fixedSize: const Size(200, 50),
                        // textStyle: const TextStyle(fontWeight: FontWeight.w900),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () => rootRouter
                          .replace(const CreateWalletFirstOnboardingScreen()),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: const [
                              AutoSizeText(
                                'Early bird access',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                'Get notified when we are ready.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                'Your vouchers will still be valid!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            themeShade850, // ~ The backgroundColor and foregroundColor properties were introduced in Flutter 3.3. Prior to that, they were called primary and onPrimary.
                        foregroundColor: Colors.black,
                        // fixedSize: const Size(200, 50),
                        // textStyle: const TextStyle(fontWeight: FontWeight.w900),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: const [
                              AutoSizeText(
                                'Wait for launch',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                'Get notified when we are ready.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                'Your vouchers will still be valid!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
