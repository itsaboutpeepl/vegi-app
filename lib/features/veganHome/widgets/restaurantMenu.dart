import 'package:expandable_sliver_list/expandable_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/floating_cart_bar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';

class RestaurantMenuList extends StatefulWidget {
  const RestaurantMenuList({
    Key? key,
    required this.featuredList,
    required this.groupedList,
    required this.categories,
  }) : super(key: key);

  @override
  State<RestaurantMenuList> createState() => _RestaurantMenuListState();

  final List<RestaurantMenuItem> featuredList;
  final Map<String, List<RestaurantMenuItem>> groupedList;
  final Iterable<String> categories;
}

class _RestaurantMenuListState extends State<RestaurantMenuList> {
  final ExpandableSliverListController<RestaurantMenuItem>
      featuredListController = ExpandableSliverListController(
    initialStatus: ExpandableSliverListStatus.expanded,
  );
  final ExpandableSliverListController<RestaurantMenuItem>
      regularListController = ExpandableSliverListController();
  late final Map<String, ExpandableSliverListController<RestaurantMenuItem>>
      categoryItemsControllers;

  @override
  void initState() {
    categoryItemsControllers = Map<String,
        ExpandableSliverListController<RestaurantMenuItem>>.fromIterable(
      widget.categories,
      key: (cat) => cat.toString(),
      value: (cat) => ExpandableSliverListController(
        initialStatus: cat.toString().toLowerCase() == 'general'
            ? ExpandableSliverListStatus.collapsed
            : ExpandableSliverListStatus.expanded,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    featuredListController.dispose();
    regularListController.dispose();
    categoryItemsControllers.forEach((key, value) {
      value.dispose();
    });
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
                    initialItems: widget.featuredList,
                    builder: (context, item, index) => SingleFeaturedMenuItem(
                      menuItem: widget.featuredList[index],
                    ),
                    controller: featuredListController,
                  ),
                ),
              ),
              ...widget.categories
                  .where(
                    (categoryName) =>
                        categoryItemsControllers[categoryName] != null,
                  )
                  .map(
                    (categoryName) => SliverStickyHeader(
                      header: MenuStickyHeader(
                        title: categoryName,
                        controller: categoryItemsControllers[categoryName]!,
                      ),
                      sliver: SliverPadding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        sliver: ExpandableSliverList<RestaurantMenuItem>(
                          initialItems: widget.groupedList[categoryName]!,
                          builder: (context, item, index) =>
                              SingleFeaturedMenuItem(
                            menuItem: widget.groupedList[categoryName]![index],
                          ),
                          controller: categoryItemsControllers[categoryName]!,
                        ),
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