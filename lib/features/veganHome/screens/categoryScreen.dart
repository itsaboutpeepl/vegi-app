import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, index) => ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            alignment: Alignment.center,
            child: Text(index.toString()),
          ),
          title: Text('List element $index'),
        ),
      ),
    );
  }
}
