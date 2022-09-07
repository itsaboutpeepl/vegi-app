import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class DeliveryInstructionsCard extends StatefulWidget {
  const DeliveryInstructionsCard({Key? key}) : super(key: key);

  @override
  State<DeliveryInstructionsCard> createState() =>
      _DeliveryInstructionsCardState();
}

class _DeliveryInstructionsCardState extends State<DeliveryInstructionsCard> {
  TextEditingController _textController = TextEditingController();

  bool _isSavedOnce = false;
  Timer? _timer;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutViewModel>(
      converter: CheckoutViewModel.fromStore,
      distinct: true,
      onInit: (store) {},
      builder: (_, viewmodel) {
        return Card(
          color: Color(0xFFFAFAFA),
          margin: EdgeInsets.only(bottom: 15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (viewmodel.isDelivery ? 'Delivery' : 'Collection') +
                          ' Notes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    _isSavedOnce
                        ? TextButton(
                            onPressed: () => setState(() {}),
                            child: Text(
                              "Change",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          )
                        : SizedBox.shrink()
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: "deliveryInstructions",
                        onChanged: (text) {
                          _timer?.cancel();
                          if (text!.isNotEmpty) {
                            _timer = Timer(Duration(milliseconds: 500), () {
                              viewmodel.setDeliveryInstructions(
                                  _textController.text);
                              setState(() {
                                _isSavedOnce = true;
                              });
                            });
                          }
                        },
                        onEditingComplete: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          viewmodel
                              .setDeliveryInstructions(_textController.text);
                          setState(() {
                            _isSavedOnce = true;
                          });
                        },
                        controller: _textController,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
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
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
