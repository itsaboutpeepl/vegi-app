import 'package:expandable_sliver_list/expandable_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/floating_cart_bar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/searchProductsAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantMenu.dart';

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
  final Map<String, Map<String, RestaurantMenuItem>> groupedList;
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
        initialStatus: cat.toString().toLowerCase() != 'featured'
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
          StoreConnector<AppState, RestaurantMenuViewModel>(
            converter: RestaurantMenuViewModel.fromStore,
            distinct: true,
            builder: (context, viewmodel) {
              return CustomScrollView(
                slivers: [
                  const RestaurantMenuAppBar(),
                  // if (viewmodel.menuSearchIsVisible) ...[
                  //   const SearchProductsAppBar(),
                  // ],
                  const SliverPadding(padding: EdgeInsets.only(bottom: 10)),
                  SliverStickyHeader(
                    header: MenuStickyHeader<RestaurantMenuItem>(
                      title: 'Featured Items',
                      controller: featuredListController,
                    ),
                    sliver: SliverPadding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      sliver: ExpandableSliverList<RestaurantMenuItem>(
                        initialItems: widget.featuredList,
                        builder: (context, item, index) =>
                            SingleFeaturedMenuItem(
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
                          header: MenuStickyHeader<RestaurantMenuItem>(
                            title: categoryName,
                            controller: categoryItemsControllers[categoryName]!,
                          ),
                          sliver: SliverPadding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            sliver: ExpandableSliverList<RestaurantMenuItem>(
                              initialItems:
                                  widget.groupedList[categoryName]!.values,
                              builder: (context, item, index) => widget
                                      .groupedList[categoryName]!
                                      .containsKey(item.menuItemID)
                                  ? SingleFeaturedMenuItem(
                                      menuItem: item,
                                    )
                                  : Container(),
                              controller:
                                  categoryItemsControllers[categoryName]!,
                            ),
                          ),
                        ),
                      ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
                ],
              );
            },
          ),
          const FloatingCartBar(),
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    Key? key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}
