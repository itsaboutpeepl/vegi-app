import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class TipCard extends StatefulWidget {
  const TipCard({Key? key, required this.emoji, required this.tipAmount})
      : super(key: key);

  final String emoji;
  final int tipAmount;

  @override
  _TipCardState createState() => _TipCardState();
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
              ? Colors.yellow[200]
              : Colors.white,
          margin: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () {
              viewmodel.selectedUserTip == widget.tipAmount
                  ? viewmodel.updateTipAmount(0)
                  : viewmodel.updateTipAmount(widget.tipAmount);
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: widget.emoji,
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                          text: " £${widget.tipAmount}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
