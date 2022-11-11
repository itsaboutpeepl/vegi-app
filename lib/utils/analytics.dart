import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vegan_liverpool/common/di/di.dart';

class Analytics {
  static Future<void> track({
    required String eventName,
    Map<String, dynamic>? properties,
  }) async {
    if (kDebugMode || dotenv.env['mode'] != 'prod') return;
    unawaited(
      getIt<FirebaseAnalytics>().logEvent(
        name: eventName,
        parameters: properties,
      ),
    );
  }

  static Future<void> setUserId(String userId) async {
    unawaited(getIt<FirebaseAnalytics>().setUserId(id: userId));
  }

  static Future<void> setUserInformation(
    Map<String, dynamic> properties,
  ) async {
    properties.forEach((key, value) {
      getIt<FirebaseAnalytics>().setUserProperty(
        name: key,
        value: value.toString(),
      );
    });
  }
}
