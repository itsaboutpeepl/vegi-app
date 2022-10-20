import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class TipCard extends StatefulWidget {
  const TipCard({Key? key, required this.emoji, required this.tipAmount})
      : super(key: key);

  final String emoji;
  final int tipAmount;

  @override
  State<TipCard> createState() => _TipCardState();
}

class _TipCardState extends State<TipCard> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutViewModel>(
      converter: CheckoutViewModel.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Card(
          color: viewmodel.selectedUserTip == widget.tipAmount
              ? themeShade300
              : Colors.white,
          margin: const EdgeInsets.all(3),
          child: InkWell(
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                viewmodel.selectedUserTip == widget.tipAmount
                    ? viewmodel.updateTipAmount(0)
                    : viewmodel.updateTipAmount(widget.tipAmount);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(
                        widget.emoji,
                        width: 18,
                      ),
                    ),
                    TextSpan(
                      text: ' £${widget.tipAmount}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
