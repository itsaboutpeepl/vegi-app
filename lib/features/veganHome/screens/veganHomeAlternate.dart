import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/NavDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/categoryList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/veganSliverAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';
import 'package:vegan_liverpool/redux/viewsmodels/veganHome.dart';
import 'package:vegan_liverpool/utils/addresses.dart';

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(ToteScreen());
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
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
