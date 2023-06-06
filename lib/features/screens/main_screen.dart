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
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/dialogs/appUpdateNeededDialog.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListFunnel.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/mainScreen.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/constants.dart' as VegiConstants;
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TabsRouter _tabsRouter;

  bool isRouting = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), requestAppTracking);
    super.initState();
  }

  Future<void> _handleFuseAuthenticationSucceeded() async {
    (await reduxStore)
      ..dispatch(isBetaWhitelistedAddress())
      ..dispatch(
        identifyCall(
          wallet: (await reduxStore).state.userState.walletAddress,
        ),
      );
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
        // Remove below auth as already done in builder...
        // if (!store.state.userState.isLoggedOut) {
        //   store.dispatch(
        //     authenticate(),
        //   );
        //   // ..dispatch(
        //   //   enablePushNotifications(store.state.userState.walletAddress),
        //   // )
        // }
      },
      distinct: true,
      onWillChange: (previousViewModel, newViewModel) async {
        if (newViewModel.updateNotificationNeeded) {
          newViewModel.setAppUpdateNotificationSeen();
          await showDialog<void>(
            context: context,
            builder: (context) => const AppUpdateNeededDialog(),
          );
        }
        //   if (isRouting) {
        //     return;
        //   }
        //   if (newViewModel.fuseAuthenticationStatus ==
        //           FuseAuthenticationStatus.authenticated &&
        //       previousViewModel?.fuseAuthenticationStatus !=
        //           FuseAuthenticationStatus.authenticated) {
        //     return _handleFuseAuthenticationSucceeded();
        //   }
        //   final checked = checkAuth(
        //     oldViewModel: previousViewModel,
        //     newViewModel: newViewModel,
        //     routerContext: context,
        //   );
        //   if (checked.navigationNeeded) {
        //     setState(() {
        //       isRouting = true;
        //     });
        //     await checked.runNavigationIfNeeded();
        //   }
      },
      converter: MainScreenViewModel.fromStore,
      builder: (context, vm) {
        if (vm.signupIsInFlux) {
          return LoadingScaffold;
        }
        if (!vm.loggedIn) {
          log.info(
              'Push OnBoardScreen() from ${rootRouter.current.name} as not logged in');
          // TODO: This condition needs more as comes in here after we submit our UserNameScreen....
          rootRouter.replaceAll([const OnBoardScreen()]);
          return LoadingScaffold;
        }
        if (!vm.userIsVerified && VegiConstants.showWaitingListFunnel) {
          return const WaitingListFunnelScreen();
        } else if (vm.fuseAuthenticationStatus ==
                FuseAuthenticationStatus.unauthenticated ||
            vm.firebaseAuthenticationStatus ==
                FirebaseAuthenticationStatus.unauthenticated) {
          vm.authenticateAll();
          // return LoadingScaffold; // ! removed as still want to show restaurants, but without being signed in
        } else {
          peeplEatsService
              .checkVegiSessionIsStillValid()
              .then((sessionStillValid) {
            if (!sessionStillValid) {
              vm.setUserIsLoggedOut();
              log.info(
                  'Push SignUpScreen() from ${rootRouter.current.name} as vegi session has expired');
              rootRouter.replaceAll([const SignUpScreen()]);
              vm.routeToLogin();
            }
          });
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
  await Firebase.initializeApp(
    options: await DefaultFirebaseOptions.currentPlatform,
  );

  await handleFCM(
    remoteMessage,
    store,
  );
}

Future<void> handleFCM(
    RemoteMessage? remoteMessage, Store<AppState> store) async {
  if (remoteMessage != null) {
    log.info(
        'New Message From Firebase with message: ${remoteMessage}  data: ${remoteMessage.data}');
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
