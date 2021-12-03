import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:vegan_liverpool/features/veganHome/screens/foodItemScreen.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class FoodScreen extends StatefulWidget {
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
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
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
          buildScrollableListTab('Label 1', Icons.emoji_food_beverage_outlined),
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
        activeBackgroundColor: Colors.yellow[400]!,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
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
            ),
            onTap: () => Navigator.of(context).push(
              SwipeablePageRoute(
                canOnlySwipeFromEdge: true,
                builder: (BuildContext context) => FoodItemScreen(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
