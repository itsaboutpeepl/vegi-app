import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutViewModel>(
        converter: CheckoutViewModel.fromStore,
        distinct: true,
        onInit: (store) {
          _textController.text = store.state.cartState.discountCode;
        },
        builder: (_, viewmodel) {
          return Card(
            color: Color(0xFFFAFAFA),
            margin: EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewmodel.discountCode == ""
                        ? "Discount Code"
                        : "Discount Applied: -${viewmodel.discountPercent.toString()}%",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          maxLength: 20,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 5),
                            counter: SizedBox.shrink(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.grey[300]!,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: themeShade300,
                              ),
                            ),
                            fillColor: Colors.transparent,
                            isDense: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextButton(
                          onPressed: () {
                            if (viewmodel.discountCode == "") {
                              viewmodel.updateDiscount(_textController.text,
                                  () {
                                _textController.text = "Not Found";
                              });
                            } else {
                              viewmodel.updateDiscount("REMOVE", () {});
                              _textController.clear();
                            }
                          },
                          child: Text(viewmodel.discountCode == ""
                              ? "Apply"
                              : "Remove"),
                          style: TextButton.styleFrom(
                            primary: viewmodel.discountCode == ""
                                ? Colors.grey[800]
                                : Colors.red,
                            textStyle: TextStyle(
                              fontFamily: "Europa",
                              fontWeight: FontWeight.w700,
                            ),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
