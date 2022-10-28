import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/time_slot_list_vm.dart';

class DayListBuilder extends StatefulWidget {
  const DayListBuilder({Key? key}) : super(key: key);

  @override
  State<DayListBuilder> createState() => _DayListBuilderState();
}

class _DayListBuilderState extends State<DayListBuilder> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> listOfSelectableDays =
        getSelectableDatesForDeliverySlots();
    return StoreConnector<AppState, TimeSlotListViewModel>(
      converter: TimeSlotListViewModel.fromStore,
      onInit: (store) {
        if (store.state.cartState.selectedTimeSlot.isNotEmpty) {
          final day = DateTime.parse(
            store.state.cartState.selectedTimeSlot.values.first,
          ).day.toString();
          final index = listOfSelectableDays.indexWhere(
            (element) => element.keys.elementAt(0).substring(0, 2) == day,
          );

          _selected = index;
          store.dispatch(
            getFullfillmentMethods(
              newDate: DateTime.now().add(
                Duration(days: index),
              ),
            ),
          );
        } else {
          _selected = 0;
        }
      },
      builder: (context, viewmodel) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listOfSelectableDays.length,
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
                  viewmodel.getFullfillmentMethods(
                    DateTime.now().add(
                      Duration(days: index),
                    ),
                  );
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
                    Text(listOfSelectableDays[index].values.elementAt(0)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      listOfSelectableDays[index].keys.elementAt(0),
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
