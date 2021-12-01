import 'package:auto_route/auto_route.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/guideNews/screens/newsScreen.dart';

const newsTab = AutoRoute(
  path: 'newsHome',
  name: 'newsHomeTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: NewsScreen,
      name: 'newsHomeScreen',
      guards: [AuthGuard],
    ),
  ],
);
