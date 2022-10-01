import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/constants/firebase_options.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  static bool assertTopicNameIsValid(String topic) {
    bool isValidTopic = RegExp(r'^[a-zA-Z0-9-_.~%]{1,900}$').hasMatch(topic);
    assert(isValidTopic);
    return isValidTopic;
  }

  @preResolve
  Future<FirebaseApp> get firebaseApp =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
