import 'package:collection/collection.dart';
import 'package:expandable_sliver_list/expandable_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/floating_cart_bar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({
    Key? key,
    required this.menuList,
    required this.productCategories,
  }) : super(key: key);

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();

  final List<RestaurantMenuItem> menuList;

  final List<String> productCategories;
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final List<RestaurantMenuItem> _featuredList = [];
  final List<RestaurantMenuItem> _regularList = [];
  late final Map<String, List<RestaurantMenuItem>> _groupedList;
  Iterable<String> get _categories => _groupedList.keys
      .sorted(
        (a, b) => a.toLowerCase() == 'general'
            ? 1
            : b.toLowerCase() == 'general'
                ? -1
                : a.compareTo(b),
      )
      .toList();

  final ExpandableSliverListController<RestaurantMenuItem>
      featuredListController = ExpandableSliverListController();
  final ExpandableSliverListController<RestaurantMenuItem>
      regularListController = ExpandableSliverListController();
  late final Map<String, ExpandableSliverListController<RestaurantMenuItem>>
      categoryItemsControllers;

  @override
  void initState() {
    //todo: make _regularList scoped to here and remove from component state
    for (final element in widget.menuList) {
      element.isFeatured
          ? _featuredList.add(element)
          : _regularList.add(element);
    }
    _groupedList = groupBy(
      _regularList,
      (RestaurantMenuItem menuItem) => menuItem.categoryName,
    );
    categoryItemsControllers = Map<String,
        ExpandableSliverListController<RestaurantMenuItem>>.fromIterable(
      _categories,
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
              ..._categories.map(
                (categoryName) => SliverStickyHeader(
                  header: MenuStickyHeader(
                    title: categoryName,
                    controller: categoryItemsControllers[categoryName]!,
                  ),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    sliver: ExpandableSliverList<RestaurantMenuItem>(
                      initialItems: _groupedList[categoryName]!,
                      builder: (context, item, index) => SingleFeaturedMenuItem(
                        menuItem: _groupedList[categoryName]![index],
                      ),
                      controller: categoryItemsControllers[categoryName]!,
                    ),
                  ),
                ),
              ),
              // SliverStickyHeader(
              //   header: MenuStickyHeader(
              //     title: 'Regular Items',
              //     controller: regularListController,
              //   ),
              //   sliver: SliverPadding(
              //     padding: const EdgeInsets.only(top: 10, bottom: 20),
              //     sliver: ExpandableSliverList<RestaurantMenuItem>(
              //       initialItems: _regularList,
              //       builder: (context, item, index) => SingleRegularMenuItem(
              //         menuItem: _regularList[index],
              //       ),
              //       controller: regularListController,
              //     ),
              //   ),
              // ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
            ],
          ),
          const FloatingCartBar(),
        ],
      ),
    );
  }
}
