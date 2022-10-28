import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      pinned: true,
      centerTitle: false,
      title: const Text('Purple Carrot'),
      titleSpacing: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: StoreConnector<AppState, void Function()>(
            converter: (store) {
              return () => store.dispatch(ClearCart());
            },
            builder: (_, clearCart) {
              return IconButton(
                onPressed: () {
                  clearCart();
                  context.router.navigate(const VeganHomeScreenAlt());
                },
                icon: const ImageIcon(
                  AssetImage('assets/images/clear-shopping-tote.png'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
