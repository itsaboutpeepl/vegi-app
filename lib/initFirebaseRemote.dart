import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/version.dart';

import 'common/di/package_info.dart';

Future<void> initFirebaseRemote() async {
  await firebaseRemoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1), // ~ https://firebase.google.com/docs/remote-config/get-started?platform=flutter#throttling
    ),
  );

  await firebaseRemoteConfig.setDefaults({
    'requiredBuildNumberAndroid': PackageConstants.iosBuildVersion,
    'requiredBuildNumberIOS': PackageConstants.androidBuildVersion,
    'requiredWebScriptsCacheUID': 'TODO_GUID_NEEDS_GENERATING'
  });

  await firebaseRemoteConfig.fetchAndActivate();

  final store = await reduxStore;
  store.dispatch(checkForUpdatesFirebaseRemoteConfig());

  if (!kIsWeb) {
    firebaseRemoteConfig.onConfigUpdated.listen((event) async {
      await firebaseRemoteConfig.activate();
      final store = await reduxStore;
      store.dispatch(checkForUpdatesFirebaseRemoteConfig());
    });
  }
}
