import 'package:auto_route/auto_route.dart';
import 'package:expandable_sliver_list/expandable_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
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
  final ExpandableSliverListController<RestaurantMenuItem>
      featuredListController = ExpandableSliverListController();
  final ExpandableSliverListController<RestaurantMenuItem>
      regularListController = ExpandableSliverListController();

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
  void dispose() {
    featuredListController.dispose();
    regularListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            const RestaurantMenuAppBar(),
            const SliverPadding(padding: EdgeInsets.only(bottom: 10)),
            SliverStickyHeader(
              header: MenuStickyHeader(
                title: 'Featured Items',
                controller: featuredListController,
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                sliver: ExpandableSliverList<RestaurantMenuItem>(
                  initialItems: _featuredList,
                  builder: (context, item, index) => SingleFeaturedMenuItem(
                    menuItem: _featuredList[index],
                  ),
                  controller: featuredListController,
                ),
              ),
            ),
            SliverStickyHeader(
              header: MenuStickyHeader(
                title: 'Regular Items',
                controller: regularListController,
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                sliver: ExpandableSliverList<RestaurantMenuItem>(
                  initialItems: _regularList,
                  builder: (context, item, index) => SingleRegularMenuItem(
                    menuItem: _regularList[index],
                  ),
                  controller: regularListController,
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
        const FloatingCartBar(),
      ],
    );
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
