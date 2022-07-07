import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart' as ts;
import 'package:vegan_liverpool/features/veganHome/widgets/shared/backupWalletAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/navDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/preparingOrderAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/veganSliverAppBar.dart';

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
        closedColor: themeShade400,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          );
        },
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, flag) => [
          VeganSliverAppBar(),
          PreparingOrderAppBar(),
          BackupWalletAppBar(),
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


// Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Card(
//                   child: SizedBox(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         "Purple Carrot is preparing your order",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     height: 50,
//                   ),
//                   color: themeShade200,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(
//                       color: themeShade900,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               ),