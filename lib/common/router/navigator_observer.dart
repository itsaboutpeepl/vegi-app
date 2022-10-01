import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VeganNavigatorObserver extends AutoRouteObserver {
  //TODO: Extend this class and put routing logic there https://pub.dev/documentation/auto_route/latest/#:~:text=child%3A%20this)%3B%20%20%20%20%20%20%20%20%20%20%0A%20%20%7D%20%20%20%20%20%20%20%20%20%20%0A%20%20...-,Navigation%20Observers,-Navigation%20observers%20are
  //TODO: And https://pub.dev/documentation/auto_route/latest/#:~:text=Next%20we%20use%20an%20AutoRouteAware%20mixin%20which%20is%20a%20RouteAware%20mixin%20with%20tab%20support%20to%20provided%20the%20needed%20listeners%20then%20subscribe%20to%20our%20AutoRouteObserver.
  //TODO: https://www.coletiv.com/blog/flutter-navigator-2.0-made-easy-with-auto-router/#:~:text=You%20might%20also,the%20SettingsWrapperPage%20widget.

  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
