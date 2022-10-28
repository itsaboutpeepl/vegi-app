import 'package:auto_route/auto_route.dart';
import 'package:expandable_sliver_list/expandable_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/screens/floating_cart_bar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/floating_cart_bar_vm.dart';

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
    return Scaffold(
      body: Stack(
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
      ),
    );
  }
}
