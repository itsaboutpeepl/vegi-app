import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

class PreparingOrderAppBar extends StatelessWidget {
  const PreparingOrderAppBar({Key? key, required this.orderDetails})
      : super(key: key);

  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 30,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.01,
      flexibleSpace: FlexibleSpaceBar(
        title: GestureDetector(
          onTap: () => context.router.push(
            PreparingOrderPage(orderDetails: orderDetails),
          ),
          child: Card(
            color: themeShade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: themeShade900,
                width: 2,
              ),
            ),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Order #${orderDetails.orderID} ${orderDetails.orderAcceptanceStatus.displayTitle}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
