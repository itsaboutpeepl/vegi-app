import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';

class RestaurantMenuAppBar extends StatefulWidget implements PreferredSizeWidget {
  RestaurantMenuAppBar({Key? key})
      : preferredSize = Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<RestaurantMenuAppBar> createState() => _RestaurantMenuAppBarState();
}

class _RestaurantMenuAppBarState extends State<RestaurantMenuAppBar> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RestaurantItemViewModel>(
      converter: RestaurantItemViewModel.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colorToWhiteGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black),
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 8,
                  ),
                  child: Text(
                    viewmodel.restaurantName,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
