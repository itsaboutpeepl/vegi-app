import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class VegiDebugRouteObserver extends AutoRouterObserver {
  /// Called when the current route has been pushed.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.info(
      'New route pushed: ${route.settings.name} from ${previousRoute?.settings.name}',
      stackTrace: StackTrace.current,
    );
  }

  /// Called when the current route has been popped off.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.info(
      'New route popped: ${route.settings.name} from ${previousRoute?.settings.name}',
      stackTrace: StackTrace.current,
    );
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log.info(
      'Tab route visited: ${route.name}',
      stackTrace: StackTrace.current,
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log.info(
      'Tab route re-visited: ${route.name}',
      stackTrace: StackTrace.current,
    );
  }
}
