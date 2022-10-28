import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/cart_items/cart_items_list.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/other_cards/instructions_card.dart';

class CartItemsCard extends StatelessWidget {
  const CartItemsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: themeShade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Order',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const CartItemsList(),
              const Divider(
                color: themeShade300,
                thickness: 1,
                height: 30,
              ),
              GestureDetector(
                onTap: context.router.pop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Add more items',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
              const Divider(
                color: themeShade300,
                thickness: 1,
                height: 30,
              ),
              const InstructionsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
