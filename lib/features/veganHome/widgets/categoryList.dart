import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleFoodCategory.dart';

import 'demoData.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Cravings",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) => SingleCategoryItem(
                  imageURL: veganCategories[index],
                  title: veganCategoryNames[index]),
              separatorBuilder: (_, __) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
