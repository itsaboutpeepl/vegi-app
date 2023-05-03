import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart'
    hide WaitingListFunnelScreen;
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/firebase_options.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListFunnel.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/mainScreen.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TabsRouter _tabsRouter;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), requestAppTracking);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainScreenViewModel>(
      onInit: (store) {
        firebaseMessaging.getInitialMessage().then(
              (remoteMessage) => handleFCMOpenedApp(
                remoteMessage,
                store,
              ),
            );
        startFirebaseNotifs(store);
        if (!store.state.userState.isLoggedOut) {
          store.dispatch(
            fetchFuseSmartWallet(
              onSuccess: () {
                showInfoSnack(
                  context,
                  title: Messages.walletLoadedSnackbarMessage,
                );
                store
                  ..dispatch(isBetaWhitelistedAddress())
                  ..dispatch(
                    identifyCall(
                      wallet: store.state.userState.walletAddress,
                    ),
                  );
              },
              onFailure: ({String msg = ''}) {
                if (inDebugMode) {
                  showErrorSnack(
                    context: context,
                    title: Messages.walletSignedOutSnackbarMessage,
                    message: 'Failed to fetch smart wallet from fuse: $msg',
                  );
                } else {
                  showInfoSnack(
                    context,
                    title: Messages.walletSignedOutSnackbarMessage,
                  );
                }
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
            ),
          );
          // ..dispatch(
          //   enablePushNotifications(store.state.userState.walletAddress),
          // )
        }
      },
      converter: MainScreenViewModel.fromStore,
      builder: (context, vm) {
        if (!vm.userIsVerified) {
          // showInfoSnack(
          //   context,
          //   title: "You're on the waitlist. We'll be in touch soon",
          // );
          return WaitingListFunnelScreen(surveyCompleted: vm.surveyCompleted);
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

void startFirebaseNotifs(Store<AppState> store) {
  FirebaseMessaging.onBackgroundMessage(
    (remoteMessage) => _firebaseMessagingBackgroundHandler(
      remoteMessage,
      store,
    ),
  );

  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) => handleFCMOpenedApp(
      message,
      store,
    ),
  );

  FirebaseMessaging.onMessage.listen(
    (message) => handleFCM(
      message,
      store,
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage remoteMessage,
  Store<AppState> store,
) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await handleFCM(
    remoteMessage,
    store,
  );
}

Future<void> handleFCM(
    RemoteMessage? remoteMessage, Store<AppState> store) async {
  if (remoteMessage != null) {
    log.info('New Message From Firebase: ${remoteMessage.data}');
  } else {
    return;
  }
  if (remoteMessage.category == null) {
    return;
  }
  final messageCategory = FirebaseMessagingCategoriesEnumHelpers.fromString(
    remoteMessage.category!,
  );
  if (messageCategory == FirebaseMessagingCategoriesEnum.payment_confirmed ||
      messageCategory == FirebaseMessagingCategoriesEnum.payment_succeeded) {
    store.dispatch(
      updateOrderPaymentStatus(
        orderId: remoteMessage.data['orderId'] as String,
        paymentIntentId: remoteMessage.data['paymentIntentId'] as String,
        status:
            messageCategory == FirebaseMessagingCategoriesEnum.payment_confirmed
                ? PaymentStatus.confirmed
                : PaymentStatus.succeeded,
        errorHandler: (p0) {},
        successHandler: () {},
      ),
    );
    await rootRouter.push(const AllOrdersPage());
  } else if (messageCategory ==
      FirebaseMessagingCategoriesEnum.payment_failed) {
    store.dispatch(
      updateOrderPaymentStatus(
        orderId: remoteMessage.data['orderId'] as String,
        paymentIntentId: remoteMessage.data['paymentIntentId'] as String,
        status: PaymentStatus.failed,
        errorHandler: (p0) {},
        successHandler: () {},
      ),
    );
  }
}

Future<void> handleFCMOpenedApp(
  RemoteMessage? remoteMessage,
  Store<AppState> store,
) async {
  if (remoteMessage != null) {
    log.info('New Message From Firebase opened the app: ${remoteMessage.data}');
  } else {
    return;
  }
  if (remoteMessage.category == null) {
    return;
  }
  final messageCategory = FirebaseMessagingCategoriesEnumHelpers.fromString(
    remoteMessage.category!,
  );
  if (messageCategory == FirebaseMessagingCategoriesEnum.payment_confirmed ||
      messageCategory == FirebaseMessagingCategoriesEnum.payment_succeeded) {
    store.dispatch(
      updateOrderPaymentStatus(
        orderId: remoteMessage.data['orderId'] as String,
        paymentIntentId: remoteMessage.data['paymentIntentId'] as String,
        status:
            messageCategory == FirebaseMessagingCategoriesEnum.payment_confirmed
                ? PaymentStatus.confirmed
                : PaymentStatus.succeeded,
        errorHandler: (p0) {},
        successHandler: () {},
      ),
    );
    await rootRouter.push(const AllOrdersPage());
  } else if (messageCategory ==
      FirebaseMessagingCategoriesEnum.payment_failed) {
    store.dispatch(
      updateOrderPaymentStatus(
        orderId: remoteMessage.data['orderId'] as String,
        paymentIntentId: remoteMessage.data['paymentIntentId'] as String,
        status: PaymentStatus.failed,
        errorHandler: (p0) {},
        successHandler: () {},
      ),
    );
    await rootRouter.push(const AllOrdersPage());
  }
}
