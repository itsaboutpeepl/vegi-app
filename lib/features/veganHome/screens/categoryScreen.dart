import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/ScrollableTab/ScrollableListTab.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/ScrollableTab/ScrollableListTabView.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/ScrollableTab/listTab.dart';

class RestaurantMenuScreen extends StatefulWidget {
  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
      body: ScrollableListTabView(
        tabHeight: 60,
        bodyAnimationDuration: const Duration(milliseconds: 150),
        tabAnimationCurve: Curves.easeOut,
        tabAnimationDuration: const Duration(milliseconds: 200),
        tabs: [
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 2', Icons.cake_outlined),
          buildScrollableListTab('Label 3', Icons.local_pizza_outlined),
        ],
      ),
    );
  }

  ScrollableListTab buildScrollableListTab(String label, IconData icon) {
    return ScrollableListTab(
      tab: ListTab(
        label: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        showIconOnList: false,
        showLabelOnList: false,
        activeBackgroundColor: Colors.yellow[400]!,
        activeBorderColor: Colors.black,
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (_, index) =>
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        itemBuilder: (_, index) => menuItem(_),
      ),
    );
  }
}

Widget menuItem(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text(
                    'Random Meal',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.yellow[400],
                    child: IconButton(
                      onPressed: () {
                        print('Added to cart');
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Text('Even Randomer description'),
            Text('\$1.49'),
          ],
        ),
        onTap: () => context.router.push(RestaurantListingScreen())),
  );
}
