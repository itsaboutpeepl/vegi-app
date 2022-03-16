import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart'
    as ts;

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({Key? key, required this.menuList})
      : super(key: key);

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();

  final List<MenuItem> menuList;
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  List<MenuItem> _featuredList = [];
  List<MenuItem> _regularList = [];

  @override
  void initState() {
    // widget.menuList.forEach((element) {
    //   element.isFeatured
    //       ? _featuredList.add(element)
    //       : _regularList.add(element);
    // });

    //TODO: Remove Eventually
    for (var i = 0; i < 2; i++) {
      _featuredList.add(widget.menuList.first);
    }

    for (var i = 0; i < 4; i++) {
      _regularList.add(widget.menuList.first);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: MenuStickyHeader(title: "Featured Items"),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      SingleFeaturedMenuItem(menuItem: _featuredList[index]),
                  childCount: _featuredList.length,
                ),
              ),
            ),
          ),
          SliverStickyHeader(
            header: MenuStickyHeader(
              title: "Regular Items",
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      SingleRegularMenuItem(menuItem: _regularList[index]),
                  childCount: _regularList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
