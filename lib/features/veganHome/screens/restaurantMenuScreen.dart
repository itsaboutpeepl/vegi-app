import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleMenuItem.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantMenuAppBar(
        centerText: "Liverpool, L17 0AB",
        pageTitle: "DaCimino",
      ),
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
        closedColor: Colors.black,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.yellow[100],
              ),
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Featured Items',
                style: TextStyle(
                    color: Colors.grey[850],
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SingleMenuItem(
                    menuItem: widget.menuList[0],
                  ),
                  childCount: 5,
                ),
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow[100],
              ),
              height: 60.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Regular Items',
                style: TextStyle(
                    color: Colors.grey[850],
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SingleMenuItem(
                    menuItem: widget.menuList[0],
                  ),
                  childCount: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// ScrollableListTabView(
//         bodyAnimationDuration: const Duration(milliseconds: 150),
//         tabAnimationCurve: Curves.easeOut,
//         tabAnimationDuration: const Duration(milliseconds: 200),
//         tabs: [
//           buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
//           buildScrollableListTab('Label 2', Icons.cake_outlined),
//           buildScrollableListTab('Label 3', Icons.local_pizza_outlined),
//         ],
//       ),

  // ScrollableListTab buildScrollableListTab(String label, IconData icon) {
  //   return ScrollableListTab(
  //     tab: ListTab(
  //       label: Text(
  //         label,
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       icon: Icon(
  //         icon,
  //         color: Colors.black,
  //       ),
  //       showIconOnList: false,
  //       showLabelOnList: false,
  //       activeBackgroundColor: Colors.yellow[200]!,
  //       activeBorderColor: Colors.black,
  //     ),
  //     body: ListView.separated(
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       itemCount: widget.menuList.length,
  //       separatorBuilder: (_, index) =>
  //           Padding(padding: EdgeInsets.symmetric(vertical: 15)),
  //       itemBuilder: (_, index) => SingleMenuItem(
  //         menuItem: widget.menuList[index],
  //       ),
  //     ),
  //   );
  // }
}
