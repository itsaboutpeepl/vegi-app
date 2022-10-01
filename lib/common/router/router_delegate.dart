import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class AppRouter extends AutoRouterDelegate {
  final Store<AppState> store;

  AppRouter(
    StackRouter controller, {
    required this.store,
    List<PageRouteInfo>? initialRoutes,
    WidgetBuilder? placeholder,
    String? navRestorationScopeId,
    String? initialDeepLink,
    NavigatorObserversBuilder navigatorObservers =
        defaultNavigatorObserversBuilder,
  }) : super(controller,
            initialRoutes: initialRoutes,
            placeholder: placeholder,
            navRestorationScopeId: navRestorationScopeId,
            initialDeepLink: initialDeepLink,
            navigatorObservers: navigatorObservers) {}

  // factory AppRouter.declarative(
  //   RootStackRouter controller, {
  //   required RoutesBuilder routes,
  //   String? navRestorationScopeId,
  //   String? initialDeepLink,
  //   RoutePopCallBack? onPopRoute,
  //   OnNavigateCallBack? onNavigate,
  //   NavigatorObserversBuilder navigatorObservers,
  // }) = _DeclarativeAutoRouterDelegate;

}
