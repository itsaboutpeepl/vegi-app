import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart'
    as ts;
import 'package:vegan_liverpool/features/veganHome/widgets/shared/navDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/veganSliverAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class VeganHomeScreen extends StatefulWidget {
  const VeganHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganHomeScreen> createState() => _VeganHomeScreenState();
}

class _VeganHomeScreenState extends State<VeganHomeScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        ],
        body: FeaturedRestaurantList(),
      ),
    );
  }
}

// Widget _featuredRestaurantsHeader() {
//   return SliverToBoxAdapter(
//     child: Padding(
//       padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
//       child: Text(
//         "Featured",
//         style: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//     ),
//   );
// }
