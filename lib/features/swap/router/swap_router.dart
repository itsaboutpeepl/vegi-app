import 'package:auto_route/auto_route.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/swap/screens/review_swap.dart';
import 'package:vegan_liverpool/features/swap/screens/swap.dart';

const swapTab = AutoRoute(
  path: 'swap',
  name: 'swapTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    AutoRoute(
      initial: true,
      page: SwapScreen,
      name: 'swapScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ReviewSwapScreen,
      guards: [AuthGuard],
    ),
  ],
);
