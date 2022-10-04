import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/firebase_options.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/bottom_bar.dart';
import 'package:vegan_liverpool/services.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TabsRouter _tabsRouter;

  void handleFirebaseConfig() {
    firebaseMessaging.requestPermission();
    firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, sound: true);
  }

  @override
  void initState() {
    handleFirebaseConfig();
    firebaseMessaging
        .getToken()
        .then((value) => print("FCM TOKEN HEREEE $value"));

    firebaseMessaging
        .getAPNSToken()
        .then((value) => print("APNS TOKEN $value"));

    Function handleFCM = (RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        print("PRINTING REMOTE MESSAGE HELOOOOO");
        print("RMDATA ${remoteMessage.data}");
        print("RMNOTIF ${remoteMessage.notification}");
        print("RMFROM ${remoteMessage.from}");
      }
    };

    firebaseMessaging.getInitialMessage().then((RemoteMessage? remoteMessage) {
      handleFCM(remoteMessage);
    });

    startFirebaseNotifs();

    Future.delayed(Duration(seconds: 5), () => requestAppTracking());

    super.initState();
  }

  void requestAppTracking() async {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_tabsRouter.canPopSelfOrChildren) {
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: StoreConnector<AppState, BottomBarViewModel>(
        distinct: true,
        converter: BottomBarViewModel.fromStore,
        builder: (_, vm) => AutoTabsScaffold(
          animationDuration: Duration(milliseconds: 0),
          routes: [
            VeganHomeAltTab(),
          ],
        ),
      ),
    );
  }

  void startFirebaseNotifs() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage? remoteMessage) => handleFCM(remoteMessage));

    FirebaseMessaging.onMessage
        .listen((RemoteMessage? remoteMessage) => handleFCM(remoteMessage));
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage remoteMessage) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    handleFCM(remoteMessage);
  }

  void handleFCM(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      print("GOT MESSAGE FROM FIREBASE: ${remoteMessage.data}");
    }
  }
}
