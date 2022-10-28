import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/payment_bar/payment_button.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/payment_bar/payment_method_selector.dart';

class PaymentBar extends StatelessWidget {
  const PaymentBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: themeShade300,
          border: Border(
            top: BorderSide(color: themeShade200),
          ),
        ),
        width: width,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [PaymentMethodSelector(), PaymentButton()],
          ),
        ),
      ),
    );
  }
}
