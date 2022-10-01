import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';

class SwitchDeliveryCollectionModal extends StatefulWidget {
  const SwitchDeliveryCollectionModal({Key? key}) : super(key: key);
  @override
  _SwitchDeliveryCollectionModalState createState() =>
      _SwitchDeliveryCollectionModalState();
}

class _SwitchDeliveryCollectionModalState
    extends State<SwitchDeliveryCollectionModal> {
  String _dropdownValue = "L1";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: colorToWhiteGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    constraints: BoxConstraints(minHeight: 240),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //   viewmodel.isDelivery
                              //       ? "Delivering To "
                              //       : "Collection",
                              //   style: TextStyle(
                              //     fontSize: 22,
                              //     fontWeight: FontWeight.w900,
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () => {viewmodel.setIsDelivery(true)},
                                child: Container(
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Delivery",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        // backgroundColor: themeShade500,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: viewmodel.isDelivery
                                        ? themeShade500
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: const Color(0xFF000000),
                                        width: 4.0,
                                        style: BorderStyle.solid), //Border.all
                                    /*** The BorderRadius widget  is here ***/
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ), //BorderRadius.all
                                  ), //BoxDecoration
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {viewmodel.setIsDelivery(false)},
                                child: Container(
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Collection",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        // backgroundColor: themeShade500,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: viewmodel.isDelivery
                                        ? Colors.transparent
                                        : themeShade500,
                                    border: Border.all(
                                        color: const Color(0xFF000000),
                                        width: 4.0,
                                        style: BorderStyle.solid), //Border.all
                                    /*** The BorderRadius widget  is here ***/
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ), //BorderRadius.all
                                  ), //BoxDecoration
                                ),
                              ),
                              // viewmodel.isDelivery //TODO Convert Delivery to dropdown button list to within the bottom modal
                              //     ? Padding(
                              //         padding: const EdgeInsets.only(bottom: 1.5),
                              //         child: DropdownButton<String>(
                              //           menuMaxHeight:
                              //               MediaQuery.of(context).size.height *
                              //                   0.3,
                              //           alignment: Alignment.centerLeft,
                              //           isDense: true,
                              //           style: TextStyle(
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.w700,
                              //             color: Colors.black,
                              //             fontFamily: "Europa",
                              //           ),
                              //           value: _dropdownValue,
                              //           borderRadius: BorderRadius.circular(10),
                              //           underline: SizedBox.shrink(),
                              //           items: viewmodel.postalCodes
                              //               .map(
                              //                 (value) => DropdownMenuItem<String>(
                              //                   child: Text(
                              //                     value,
                              //                     style: TextStyle(fontSize: 20),
                              //                   ),
                              //                   value: value,
                              //                 ),
                              //               )
                              //               .toList(),
                              //           onChanged: (value) {
                              //             setState(() {
                              //               _dropdownValue = value!;
                              //               viewmodel.changeOutCode(value);
                              //             });
                              //           },
                              //         ),
                              //       )
                              //     : SizedBox.shrink(),
                            ],
                          ),
                        ),
                        if (viewmodel
                            .isDelivery) // TODO: Show the postalcode picker for collection
                          Container(
                            color: Colors.white60,
                            child: Center(
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  // disabledItemFn: (String s) => s.startsWith('I'),
                                ),
                                items: viewmodel.postalCodes.isEmpty
                                    ? <String>['L1 (disabled)']
                                    : viewmodel.postalCodes,
                                // dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration),
                                enabled: !viewmodel.postalCodes.isEmpty,
                                onChanged: (item) {
                                  if (item != null)
                                    viewmodel.changeOutCode(item);
                                },
                                selectedItem: viewmodel.postalCodes.isEmpty
                                    ? 'L1 (disabled)'
                                    : viewmodel.postalCodes.first,
                              ),
                            ),
                          ),
                        // * Needed to show full contents of card above in modal
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // DeliveryMapViewFloatingBar(
            //   selectedOutCode: _dropdownValue,
            // ),
          ],
        );
      },
    );
  }
}
