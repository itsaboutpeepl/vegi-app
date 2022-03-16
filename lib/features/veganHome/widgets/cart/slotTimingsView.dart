import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class SlotTimingsView extends StatefulWidget {
  const SlotTimingsView({Key? key}) : super(key: key);

  @override
  State<SlotTimingsView> createState() => _SlotTimingsViewState();
}

class _SlotTimingsViewState extends State<SlotTimingsView> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutViewModel>(
      converter: CheckoutViewModel.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Card(
          color: Color(0xFFFAFAFA),
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Schedule Order",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 7)),
                        builder: (_, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.grey[800]!,
                                onPrimary: themeShade500,
                                onSurface: Colors.grey[800]!,
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                            child: child!,
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          //set loading = true;
                          setState(() {
                            _isLoading = true;
                          });
                          //make new call to api;
                          viewmodel.updateSlotTimes(value);
                          //set loading to false;
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                          //show slots;
                        }
                      }),
                      icon: Icon(
                        Icons.edit_calendar,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                padding: EdgeInsets.only(bottom: 15, left: 10),
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: themeShade300),
                      )
                    : viewmodel.collectionSlots.isEmpty &&
                            viewmodel.selectedDeliveryAddressIndex ==
                                0 //if collectionSlots are empty, and chosen method is collection (first list object)
                        ? Center(
                            child: Text("No Slots Avaliable"),
                          )
                        : viewmodel.deliverySlots
                                .isEmpty //else if delivery slots are empty
                            ? Center(
                                child: Text("No Slots Avaliable"),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    viewmodel.selectedDeliveryAddressIndex == 0
                                        ? viewmodel.collectionSlots.length
                                        : viewmodel.deliverySlots.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ChoiceChip(
                                    selectedColor: themeShade100,
                                    avatar: Icon(
                                      Icons.timer,
                                      size: 18,
                                    ),
                                    label: Text(
                                      mapToString(
                                        viewmodel.selectedDeliveryAddressIndex ==
                                                0
                                            ? viewmodel.collectionSlots[index]
                                            : viewmodel.deliverySlots[index],
                                      ),
                                      style: TextStyle(color: Colors.grey[800]),
                                    ),
                                    selected:
                                        viewmodel.selectedSlotIndex == index,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        viewmodel.updateSlotIndex(index);
                                      });
                                    },
                                  ),
                                ),
                              ),
              )
            ],
          ),
        );
      },
    );
  }
}
