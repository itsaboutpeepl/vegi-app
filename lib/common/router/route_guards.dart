import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

bool isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      resolver.next();
    } else {
      if (kDebugMode) {
        log.info('AuthGuard caught: navigating back to splash screen');
      }
      router.push(
        SplashScreen(
          onLoginResult: (bool isLoggedIn) {
            isAuthenticated = isLoggedIn;
            resolver.next(isLoggedIn);
          },
        ),
      );
    }
  }
}
