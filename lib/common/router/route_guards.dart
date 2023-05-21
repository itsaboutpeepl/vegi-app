import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

bool isAuthenticatedRouteGuard = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticatedRouteGuard) {
      resolver.next();
    } else {
      if (kDebugMode) {
        log.info(
          'AuthGuard caught: navigating back to splash screen from ${router.current.name} when trying to navigate to ${resolver.route.name}',
          stackTrace: StackTrace.current,
        );
      }
      router.push(
        SplashScreen(
          onLoginResult: (bool isLoggedIn) {
            isAuthenticatedRouteGuard = isLoggedIn;
            resolver.next(isLoggedIn);
          },
        ),
      );
    }
  }
}
