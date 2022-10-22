import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart'
    as ts;
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({Key? key, required this.menuList})
      : super(key: key);

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();

  final List<RestaurantMenuItem> menuList;
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final List<RestaurantMenuItem> _featuredList = [];
  final List<RestaurantMenuItem> _regularList = [];

  @override
  void initState() {
    for (final element in widget.menuList) {
      element.isFeatured
          ? _featuredList.add(element)
          : _regularList.add(element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            RestaurantMenuAppBar(),
            SliverStickyHeader(
              header: const MenuStickyHeader(title: 'Featured Items'),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => SingleFeaturedMenuItem(
                      menuItem: _featuredList[index],
                    ),
                    childCount: _featuredList.length,
                  ),
                ),
              ),
            ),
            SliverStickyHeader(
              header: const MenuStickyHeader(
                title: 'Regular Items',
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => SingleRegularMenuItem(
                      menuItem: _regularList[index],
                    ),
                    childCount: _regularList.length,
                  ),
                ),
              ),
            ),
          ],
        ),
        const FloatingCartBar(),
      ],
    );
    // return Scaffold(
    //   // floatingActionButton: OpenContainer(
    //   //   transitionDuration: const Duration(milliseconds: 500),
    //   //   openBuilder: (BuildContext context, VoidCallback _) {
    //   //     return const ts.ToteScreen();
    //   //   },
    //   //   closedElevation: 6,
    //   //   closedShape: const RoundedRectangleBorder(
    //   //     borderRadius: BorderRadius.all(
    //   //       Radius.circular(56 / 2),
    //   //     ),
    //   //   ),
    //   //   closedColor: themeShade400,
    //   //   closedBuilder: (BuildContext context, VoidCallback openContainer) {
    //   //     return SizedBox(
    //   //       height: 56,
    //   //       width: 56,
    //   //       child: Center(
    //   //         child: Icon(
    //   //           Icons.shopping_basket,
    //   //           color: Colors.grey[800],
    //   //         ),
    //   //       ),
    //   //     );
    //   //   },
    //   // ),
    //   body:
    // );
  }
}

class FloatingCartBar extends StatelessWidget {
  const FloatingCartBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutViewModel>(
      distinct: true,
      converter: CheckoutViewModel.fromStore,
      builder: (_, viewmodel) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: viewmodel.cartTotal > 0 ? 0 : -100,
          child: ColoredBox(
            color: themeShade200,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ShimmerButton(
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '2 Items',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '£56.72',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  buttonAction: () =>
                      context.router.push(const CheckoutScreenPt2()),
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade200,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
