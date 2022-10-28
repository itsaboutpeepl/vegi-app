import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/screens/checkout_screen_2.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/cart_items/cart_item_quantity_selector.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/cart_item_list_vm.dart';

class CartItemSingle extends StatelessWidget {
  const CartItemSingle({
    Key? key,
    required this.width,
    required this.animation,
    required this.index,
  }) : super(key: key);

  final double width;
  final Animation<double> animation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: SizedBox(
          width: width,
          child: StoreConnector<AppState, CartItemListViewModel>(
            converter: CartItemListViewModel.fromStore,
            builder: (_, viewmodel) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewmodel.names[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          viewmodel.optionValues[index],
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CartItemQuantitySelector(
                        index: index,
                        width: width,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(viewmodel.prices[index]),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
