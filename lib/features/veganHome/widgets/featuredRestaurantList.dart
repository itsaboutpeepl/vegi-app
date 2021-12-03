import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/singleRestaurantItem.dart';

import 'demoData.dart';

class FeaturedRestaurantList extends StatefulWidget {
  const FeaturedRestaurantList({Key? key}) : super(key: key);

  @override
  _FeaturedRestaurantListState createState() => _FeaturedRestaurantListState();
}

class _FeaturedRestaurantListState extends State<FeaturedRestaurantList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      itemCount: 4,
      itemBuilder: (context, index) =>
          SingleRestaurantItem(imageURL: listOfFeaturedRestImageURLs[index]),
      separatorBuilder: (_, __) => Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}
