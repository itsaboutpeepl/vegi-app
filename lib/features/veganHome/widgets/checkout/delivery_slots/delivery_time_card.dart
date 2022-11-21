import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_slots/day_list.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_slots/time_slot_list.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_time_card_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class DeliveryTimeCard extends StatelessWidget {
  const DeliveryTimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryCardViewModel>(
      converter: DeliveryCardViewModel.fromStore,
      builder: (context, viewmodel) {
        return GestureDetector(
          onTap: () {
            Analytics.track(
              eventName: AnalyticsEvents.changeTimeSlot,
            );
            showModalBottomSheet<Widget>(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (_) => DeliverySlotSelectorModalSheet(
                isDelivery: viewmodel.isDelivery,
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: themeShade100,
            shape: RoundedRectangleBorder(
              side: viewmodel.hasTimeSlot
                  ? BorderSide.none
                  : BorderSide(color: Colors.red.shade900, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (viewmodel.hasTimeSlot)
                      Text(
                        viewmodel.isDelivery
                            ? 'Delivery at: '
                            : 'Collection at:',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    Text(
                      viewmodel.selectedTimeSlot,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DeliverySlotSelectorModalSheet extends StatelessWidget {
  const DeliverySlotSelectorModalSheet({Key? key, required this.isDelivery})
      : super(key: key);
  final bool isDelivery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isDelivery
                ? 'Select a delivery slot'
                : 'Select a collection window',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const DayListBuilder(),
          const Divider(
            color: themeShade300,
            thickness: 2,
            indent: 10,
            endIndent: 10,
            height: 40,
          ),
          const Expanded(
            flex: 4,
            child: TimeSlotListBuilder(),
          ),
          const SizedBox(
            height: 20,
          ),
          PrimaryButton(
            onPressed: () {
              context.router.pop();
            },
            label: 'Confirm',
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
