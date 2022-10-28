import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/keys.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/cart_items/cart_item_single.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/cart_item_list_vm.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, CartItemListViewModel>(
      converter: CartItemListViewModel.fromStore,
      builder: (context, viewmodel) {
        if (viewmodel.ids.isEmpty) return const SizedBox.shrink();
        return AnimatedList(
          physics: const NeverScrollableScrollPhysics(),
          key: AppKeys.listKey,
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          shrinkWrap: true,
          initialItemCount: viewmodel.ids.length,
          itemBuilder: (_, index, animation) => CartItemSingle(
            width: width,
            animation: animation,
            index: index,
          ),
        );
      },
    );
  }
}
