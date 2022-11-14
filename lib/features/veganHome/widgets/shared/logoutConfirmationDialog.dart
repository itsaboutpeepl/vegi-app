import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class LogoutConfirmationDialog extends StatefulWidget {
  const LogoutConfirmationDialog({Key? key}) : super(key: key);

  @override
  State<LogoutConfirmationDialog> createState() =>
      _LogoutConfirmationDialogState();
}

class _LogoutConfirmationDialogState extends State<LogoutConfirmationDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Duration theDuration = const Duration(seconds: 30);
  late Timer countdownTimer;
  // late Duration myDuration;
  late DateTime timerFrom;
  DateTime get timerTo => timerFrom.add(theDuration);

  late void Function() _resetTimer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  void resetTimer(Store<AppState> store) {
    countdownTimer.cancel();
    theDuration = Duration(seconds: min(120, theDuration.inSeconds * 2));
    startTimer(store);
  }

  void startTimer(Store<AppState> store) {
    timerFrom = DateTime.now();
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(store),
    );
  }

  int get logoutInNSeconds => timerTo.difference(DateTime.now()).inSeconds;

  void setCountDown(Store<AppState> store) {
    setState(() {
      final seconds = timerTo.difference(DateTime.now()).inSeconds;
      if (seconds < 0) {
        countdownTimer.cancel();
        store.dispatch(LogoutRequestSuccess());
        context.router.replace(const OnBoardScreen());
        Analytics.track(eventName: AnalyticsEvents.logout);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void>(
      converter: (store) {
        _resetTimer = () {
          resetTimer(store);
        };
      },
      onInit: startTimer,
      builder: (_, viewmodel) {
        return ScaleTransition(
          scale: scaleAnimation,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Log Out!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Confirm that you have saved your seed phrase. '
                    'If so, you will be logged out in '
                    '$logoutInNSeconds '
                    'seconds!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: _resetTimer,
                    label: 'I need more time!',
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 10),
                    ),
                    onPressed: () {
                      countdownTimer.cancel();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
