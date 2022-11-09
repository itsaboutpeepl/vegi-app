import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/time_slot_list_vm.dart';

class DayListBuilder extends StatefulWidget {
  const DayListBuilder({Key? key}) : super(key: key);

  @override
  State<DayListBuilder> createState() => _DayListBuilderState();
}

class _DayListBuilderState extends State<DayListBuilder> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeSlotListViewModel>(
      converter: TimeSlotListViewModel.fromStore,
      onInit: (store) async {
        store.dispatch(getEligibleOrderDates());
      },
      builder: (context, viewmodel) {
        final now = DateTimeHelpers.nowDateOnly;
        if (viewmodel.eligibleOrderDates.isEmpty) {
          return const CircularProgressIndicator();
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewmodel.eligibleOrderDates.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            childAspectRatio: 1.5,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  _selected = index;
                  viewmodel.getTimeSlots(viewmodel.eligibleOrderDates[index]);
                });
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                  color:
                      index == _selected ? themeShade200 : Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(viewmodel.eligibleOrderDates[index].ordinalDate()),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      viewmodel.eligibleOrderDates[index]
                          .relativeDay(now)
                          .substring(0, 3),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
