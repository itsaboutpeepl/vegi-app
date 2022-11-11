import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/tip_selection_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class TipSelectionCard extends StatelessWidget {
  const TipSelectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: themeShade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tip your delivery partner',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your kindness means a lot! 100% of your tip will '
                'go directly to your delivery partner.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    5,
                    (index) => TipCard(
                      emoji: 'assets/images/leaf-${index + 1}.png',
                      tipAmount: (index + 1) * 100,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
    return StoreConnector<AppState, TipSelectionViewModel>(
      converter: TipSelectionViewModel.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Card(
          color: viewmodel.selectedUserTip == widget.tipAmount
              ? themeShade300
              : Colors.white,
          margin: const EdgeInsets.all(3),
          child: InkWell(
            onTap: () {
              Analytics.track(
                eventName: AnalyticsEvents.selectTip,
                properties: {
                  'tipAmount': widget.tipAmount,
                },
              );
              Future.delayed(const Duration(milliseconds: 100), () {
                viewmodel.selectedUserTip == widget.tipAmount
                    ? viewmodel.updateUserTip(tipAmount: 0)
                    : viewmodel.updateUserTip(tipAmount: widget.tipAmount);
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
                      text: widget.tipAmount.formattedPriceNoDec,
                      style: const TextStyle(
                        fontSize: 16,
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
