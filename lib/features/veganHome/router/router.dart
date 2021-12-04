import 'package:auto_route/auto_route.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/veganHome/screens/restaurantMenuScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/veganHomeAlternate.dart';

// const veganHomeTab = AutoRoute(
//   path: 'veganHome',
//   name: 'veganHomeTab',
//   page: EmptyRouterPage,
//   children: [
//     AutoRoute(
//         initial: true,
//         page: VeganHomeScreen,
//         name: 'veganHomeScreen',
//         guards: [AuthGuard]),
//   ],
// );

const veganHomeAltTab = AutoRoute(
  path: 'veganHomeAlt',
  name: 'veganHomeAltTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
        initial: true,
        page: VeganHomeScreenAlternate,
        name: 'veganHomeScreenAlt',
        guards: [AuthGuard]),
    AutoRoute(
        page: RestaurantMenuScreen,
        name: 'restaurantMenuScreen',
        guards: [AuthGuard]),
  ],
);
