import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class DeliveryInstructionsCard extends StatefulWidget {
  const DeliveryInstructionsCard({Key? key}) : super(key: key);

  @override
  State<DeliveryInstructionsCard> createState() => _DeliveryInstructionsCardState();
}

class _DeliveryInstructionsCardState extends State<DeliveryInstructionsCard> {
  TextEditingController _textController = TextEditingController();

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
                Text(
                  "Delivery Instructions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onEditingComplete: () {
                          viewmodel.setDeliveryInstructions(_textController.text);
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
