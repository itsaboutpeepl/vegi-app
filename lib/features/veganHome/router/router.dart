import 'package:auto_route/auto_route.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/veganHome/screens/veganHome.dart';

const veganHomeTab = AutoRoute(
  path: 'veganHome',
  name: 'veganHomeTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
        initial: true,
        page: VeganHomeScreen,
        name: 'veganHomeScreen',
        guards: [AuthGuard]),
  ],
);
