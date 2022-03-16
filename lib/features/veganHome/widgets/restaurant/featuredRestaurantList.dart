import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/singleRestaurantItem.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';

class FeaturedRestaurantList extends StatefulWidget {
  const FeaturedRestaurantList({Key? key}) : super(key: key);

  @override
  _FeaturedRestaurantListState createState() => _FeaturedRestaurantListState();
}

class _FeaturedRestaurantListState extends State<FeaturedRestaurantList> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      onInit: (store) {},
      builder: (_, viewmodel) {
        return viewmodel.isLoadingHomePage
            ? Center(
                child: CircularProgressIndicator(color: themeShade400),
              )
            : ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
                itemCount: viewmodel.featuredRestaurants.length,
                itemBuilder: (context, index) => SingleRestaurantItem(
                  restaurantItem: viewmodel.featuredRestaurants[index],
                ),
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
              );
      },
    );
  }
}
