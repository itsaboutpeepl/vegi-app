import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart'
    as ts;
import 'package:vegan_liverpool/features/veganHome/widgets/NavDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/categoryList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/veganSliverAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class VeganHomeScreenAlternate extends StatefulWidget {
  const VeganHomeScreenAlternate({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganHomeScreenAlternate> createState() =>
      _VeganHomeScreenAlternateState();
}

class _VeganHomeScreenAlternateState extends State<VeganHomeScreenAlternate> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      converter: UserCartViewModel.fromStore,
      distinct: true,
      onInit: (store) {},
      builder: (_, viewmodel) {
        return Scaffold(
          drawer: NavDrawer(),
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
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (_, flag) => [
              VeganSliverAppBar(),
              CategoryList(),
              _featuredRestaurantsHeader(),
            ],
            body: FeaturedRestaurantList(),
          ),
        );
      },
    );
  }
}

Widget _featuredRestaurantsHeader() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      child: Text(
        "Featured",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
