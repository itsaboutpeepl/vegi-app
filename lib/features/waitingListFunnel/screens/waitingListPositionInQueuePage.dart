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

class WaitingListPositionInQueuePage extends StatelessWidget {
  const WaitingListPositionInQueuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WaitinglistPositionInQueueViewModel>(
      converter: WaitinglistPositionInQueueViewModel.fromStore,
      onInit: (store) {
        if (store.state.userState.userIsVerified) {
          rootRouter.replaceAll([const MainScreen()]);
          return;
        }
        store.dispatch(
          fetchPositionInWaitingListQueue(
            errorHandler: (p0) {
              showErrorSnack(
                context: context,
                title: Messages.checkWaitingListError,
              );
            },
          ),
        );
      },
      builder: (context, viewModel) {
        const queueTextSize = 48.0;
        if (viewModel.userIsVerified) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.positionInQueue == null) {
          Analytics.track(
            eventName: AnalyticsEvents.errorCheckingQueue,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error':
                  "User's position in queue is null for email: ${viewModel.userEmail}",
            },
          );
          return const EmptyStatePage(
            emoji: '😳',
            title: Messages.connectionError,
            subtitle: Messages.unableToCheckWaitingListQueue,
            refreshable: false,
          );
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
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        top: 20,
                        left: 40,
                        right: 40,
                      ),
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'You are',
                            ),
                            TextSpan(
                              text:
                                  ' ${viewModel.positionInQueue!.thFormatted(dontFormatStrictlyAbove: 10)} ',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: queueTextSize * 2.0,
                              ),
                            ),
                            TextSpan(
                              text: 'in the queue',
                            ),
                          ],
                          style: TextStyle(
                            fontSize: queueTextSize,
                            color: Colors.grey[850],
                            fontFamily: 'Fat Cheeks',
                          ),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    if (viewModel.positionInQueue! <=
                        AppConfig.waitingListQueuePreLaunchPerksBound)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                              top: 20,
                              left: 40,
                              right: 40,
                            ),
                            child: AutoSizeText(
                              'Congratulations!',
                              textAlign: TextAlign.center,
                              // maxFontSize: 60,
                              minFontSize: 28,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 58,
                                color: Colors.grey[850],
                              ),
                            ),
                          ),
                          // const Spacer(),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'You',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[850],
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' are ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: themeShade850,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'eligible for pre-launch perks',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[850],
                                    ),
                                  ),
                                ],
                              ),
                              minFontSize: 16,
                              maxFontSize: 20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ArrowButton(
                            onTap: () {
                              rootRouter
                                  .push(const PreLaunchPerksDetailsRoute());
                            },
                            iconSize: 80,
                          ),
                        ],
                      )
                    else ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: Messages.answerYNQuestionsToBumpQueue,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          minFontSize: 16,
                          maxFontSize: 20,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ArrowButton(
                        onTap: () {
                          rootRouter.push(
                            WaitingListSurveyQuestionsScreens(
                              surveyCompleted: viewModel.surveyCompleted,
                            ),
                          );
                        },
                        iconSize: 80,
                      ),
                    ],
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
