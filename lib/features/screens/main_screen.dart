import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart'
    hide WaitingListFunnelScreen;
import 'package:vegan_liverpool/constants/firebase_options.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListFunnel.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/mainScreen.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TabsRouter _tabsRouter;

  @override
  void initState() {
    firebaseMessaging.getInitialMessage().then(handleFCM);
    startFirebaseNotifs();
    Future.delayed(const Duration(seconds: 5), requestAppTracking);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainScreenViewModel>(
      onInit: (store) {
        store
          ..dispatch(fetchFuseSmartWallet(
            onSuccess: () {
              showInfoSnack(
                context,
                title: Messages.walletLoadedSnackbarMessage,
              );
            },
            onFailure: () {
              showInfoSnack(
                context,
                title: Messages.walletSignedOutSnackbarMessage,
              );
            },
            onError: (error) {
              if (inDebugMode) {
                showErrorSnack(
                  context: context,
                  title: Messages.walletSignedOutSnackbarMessage,
                  message: 'Error fetching smart wallet: $error',
                );
              } else {
                showInfoSnack(
                  context,
                  title: Messages.walletSignedOutSnackbarMessage,
                );
              }
            },
          ))
          // ..dispatch(
          //   enablePushNotifications(store.state.userState.walletAddress),
          // )
          ..dispatch(isBetaWhitelistedAddress())
          ..dispatch(identifyCall(wallet: store.state.userState.walletAddress));
      },
      converter: MainScreenViewModel.fromStore,
      builder: (context, vm) {
        if (vm.loggedIn && !vm.userIsVerified) {
          // showInfoSnack(
          //   context,
          //   title: "You're on the waitlist. We'll be in touch soon",
          // );
          return const WaitingListFunnelScreen(surveyCompleted: true);
        }
        return WillPopScope(
          onWillPop: () {
            if (_tabsRouter.canPop()) {
              return Future.value(true);
            } else {
              return Future.value(false);
            }
          },
          child: const AutoTabsScaffold(
            animationDuration: Duration.zero,
            routes: [
              VeganHomeTab(),
            ],
          ),
        );
      },
    );
  }
}

Future<void> requestAppTracking() async {
  await AppTrackingTransparency.requestTrackingAuthorization();
}

void startFirebaseNotifs() {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessageOpenedApp.listen(handleFCM);

  FirebaseMessaging.onMessage.listen(handleFCM);
}

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage remoteMessage,
) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await handleFCM(remoteMessage);
}

Future<void> handleFCM(RemoteMessage? remoteMessage) async {
  if (remoteMessage != null) {
    print('New Message From Firebase: ${remoteMessage.data}');
  }
}
