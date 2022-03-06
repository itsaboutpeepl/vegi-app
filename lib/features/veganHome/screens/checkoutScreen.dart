import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/addressList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/paymentSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shimmerButton.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/tipCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutViewModel>(
      converter: CheckoutViewModel.fromStore,
      distinct: true,
      onInit: (store) {},
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: CustomAppBar(
            centerText: "",
            pageTitle: "Checkout",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddressList(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Slide left for Pickup",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                SizedBox(height: 10),
                SlotTimingsView(),
                TipCardView(),
                DiscountCard(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25.0),
                  child: ShimmerButton(
                    baseColor: Colors.yellow,
                    highlightColor: Colors.yellow[100]!,
                    buttonAction: () {
                      viewmodel.createOrder();
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        elevation: 5,
                        context: context,
                        builder: (context) => PaymentSheet(),
                      );
                    },
                    buttonContent: Row(
                      children: [
                        Text(
                          'Pay',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          cFPrice(viewmodel.cartTotal),
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SlotTimingsView extends StatefulWidget {
  const SlotTimingsView({Key? key}) : super(key: key);

  @override
  State<SlotTimingsView> createState() => _SlotTimingsViewState();
}

class _SlotTimingsViewState extends State<SlotTimingsView> {
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
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                padding: EdgeInsets.only(bottom: 15, left: 10),
                child: viewmodel.collectionSlots.isEmpty &&
                        viewmodel.selectedDeliveryAddressIndex == 0
                    ? Center(
                        child: Text("No Slots Avaliable"),
                      )
                    : viewmodel.deliverySlots.isEmpty
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
                                selectedColor: Colors.yellow[100],
                                avatar: Icon(
                                  Icons.timer,
                                  size: 18,
                                ),
                                label: Text(
                                  mapToString(
                                    viewmodel.selectedDeliveryAddressIndex == 0
                                        ? viewmodel.collectionSlots[index]
                                        : viewmodel.deliverySlots[index],
                                  ),
                                ),
                                selected: viewmodel.selectedSlotIndex == index,
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

class TipCardView extends StatefulWidget {
  const TipCardView({Key? key}) : super(key: key);

  @override
  State<TipCardView> createState() => _TipCardViewState();
}

class _TipCardViewState extends State<TipCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFAFAFA),
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add a Tip?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Support your delivery partner and make their day! 100% of your tip will be transferred to them!",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TipCard(
                  emoji: "😒",
                  tipAmount: 1,
                ),
                TipCard(
                  emoji: "🤨",
                  tipAmount: 2,
                ),
                TipCard(
                  emoji: "😐",
                  tipAmount: 3,
                ),
                TipCard(
                  emoji: "😏",
                  tipAmount: 4,
                ),
                TipCard(
                  emoji: "🥵",
                  tipAmount: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
                                color: Colors.yellow[300]!,
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
                              viewmodel.updateDiscount(_textController.text);
                            } else {
                              viewmodel.updateDiscount("REMOVE");
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
