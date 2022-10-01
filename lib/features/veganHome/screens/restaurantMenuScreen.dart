import 'package:animations/animations.dart';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart'
    as ts;
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

class ItemsCategory implements ExpandableListSection<RestaurantMenuItem> {
  ItemsCategory({
    required this.category,
    required this.items,
  }) : super();

  bool _isExpanded = false;

  final String category;
  final List<RestaurantMenuItem> items;

  @override
  List<RestaurantMenuItem>? getItems() {
    return items;
  }

  @override
  bool isSectionExpanded() {
    return _isExpanded;
  }

  @override
  void setSectionExpanded(bool expanded) {
    _isExpanded = expanded;
  }
}

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({Key? key, required this.menuList})
      : super(key: key);

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();

  final List<RestaurantMenuItem> menuList;
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  List<RestaurantMenuItem> _featuredList = [];
  List<RestaurantMenuItem> _regularList = [];
  //TODO: Replace above with grouped item dict
  late final List<ItemsCategory> _items;
  @override
  void initState() {
    widget.menuList.forEach((element) {
      element.isFeatured
          ? _featuredList.add(element)
          : _regularList.add(element);
    });
    
    _items = groupBy<RestaurantMenuItem, String>(
            widget.menuList, (element) => element.category)
        .entries
        .map((e) => ItemsCategory(category: e.key, items: e.value))
        .toList();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: RestaurantMenuAppBar(),
        floatingActionButton: OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          openBuilder: (BuildContext context, VoidCallback _) {
            return const ts.ToteScreen();
          },
          closedElevation: 6.0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(56 / 2),
            ),
          ),
          closedColor: themeShade400,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return SizedBox(
              height: 56,
              width: 56,
              child: Center(
                child: Icon(
                  Icons.shopping_basket,
                  color: Colors.grey[800],
                ),
              ),
            );
          },
        ),
        body: ExpandableListView(
          builder:
              SliverExpandableChildDelegate<RestaurantMenuItem, ItemsCategory>(
            sectionList: _items,
            headerBuilder: (context, section, index) =>
                //~ https://flutterawesome.com/flutter-implementation-of-sticky-headers-and-expandable-list/
                SliverStickyHeader(
              header: MenuStickyHeader(title: _items[index].category),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                // sliver: ,
              ),
            ),
            itemBuilder: (context, section, item, index) => SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SingleFeaturedMenuItem(
                      menuItem: _items[index].items[index]),
                  childCount: _items[index].items.length,
                ),
              ),
            ),
          ),
        ),
        // body: CustomScrollView(
        //   slivers: [
        // SliverStickyHeader(
        //   header: MenuStickyHeader(title: "Featured Items"),
        //   sliver: SliverPadding(
        //     padding: const EdgeInsets.only(top: 10, bottom: 20),
        //     sliver: SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (context, index) =>
        //             SingleFeaturedMenuItem(menuItem: _featuredList[index]),
        //         childCount: _featuredList.length,
        //       ),
        //     ),
        //   ),
        // ),
        // SliverStickyHeader(
        //   header: MenuStickyHeader(
        //     title: "Regular Items",
        //   ),
        //   sliver: SliverPadding(
        //     padding: const EdgeInsets.only(top: 10, bottom: 20),
        //     sliver: SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (context, index) =>
        //             SingleRegularMenuItem(menuItem: _regularList[index]),
        //         childCount: _regularList.length,
        //       ),
        //     ),
        //   ),
        // ),
        // ],
        // ),
      ),
    );
  }
}
