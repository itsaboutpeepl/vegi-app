import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/AddressList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/paymentSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shimmerButton.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/tipCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

List<String> _listOfTimings = [
  "ASAP",
  "6:30",
  "7:00",
  "7:30",
  "8:00",
  "8:30",
  "9:00",
  "9:30",
  "10:00"
];

Map<String, int> _discountCodes = {
  "TEST20": 20,
  "TEST5": 5,
  "TEST10": 10,
  "TEST15": 15,
};

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late PageController _pageController;
  String _typeOfScheduling = "Delivery";
  bool _isScheduledDelivery = false;
  int _value = 0;
  bool _isDiscountApplied = false;
  int _discountPercent = 0;
  late TextEditingController _textController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9, initialPage: 1);
    _pageController.addListener(() {
      _pageController.page == 0
          ? _typeOfScheduling = "Pickup"
          : _typeOfScheduling = "Delivery";
      setState(() {});
    });

    _textController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      converter: UserCartViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        _isDiscountApplied =
            store.state.cartState.cartDiscountPercent > 0 ? true : false;
        _discountPercent = store.state.cartState.cartDiscountPercent;
      },
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
                AddressList(pageController: _pageController),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Slide left for pickup",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: Color(0xFFFAFAFA),
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              "Schedule Order",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            Spacer(),
                            // Transform.scale(
                            //   scale: 1.3,
                            //   child: Checkbox(
                            //     visualDensity: VisualDensity.standard,
                            //     side: BorderSide(color: Colors.grey[800]!),
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10)),
                            //     checkColor: Colors.grey[800],
                            //     activeColor: Colors.yellow[300],
                            //     value: _isScheduledDelivery,
                            //     onChanged: (value) {
                            //       setState(() {
                            //         _isScheduledDelivery = value!;
                            //       });
                            //     },
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        padding: EdgeInsets.only(bottom: 15, left: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _listOfTimings.length,
                          itemBuilder: ((context, index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ChoiceChip(
                                  selectedColor: Colors.yellow[100],
                                  avatar: Icon(
                                    Icons.timer,
                                    size: 18,
                                  ),
                                  label: Text(_listOfTimings[index]),
                                  selected: _value == index,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      _value = (selected ? index : null)!;
                                    });
                                  },
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  color: Color(0xFFFAFAFA),
                  margin: EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add a Tip?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Support your delivery partner and make their day! 100% of your tip will be transferred to them!",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TipCard(
                              emoji: "😒",
                              tipAmount: "£1",
                            ),
                            TipCard(
                              emoji: "🤨",
                              tipAmount: "£2",
                            ),
                            TipCard(
                              emoji: "😐",
                              tipAmount: "£3",
                            ),
                            TipCard(
                              emoji: "😏",
                              tipAmount: "£4",
                            ),
                            TipCard(
                              emoji: "🥵",
                              tipAmount: "£5",
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFFFAFAFA),
                  margin: EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isDiscountApplied
                              ? "Discount Applied: -${_discountPercent.toString()}%"
                              : "Discount Code",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
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
                                textCapitalization:
                                    TextCapitalization.characters,
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
                                  setState(() {
                                    if (_isDiscountApplied) {
                                      _discountPercent = 0;
                                      _isDiscountApplied = false;
                                      viewmodel.updateDiscount(0);
                                      _textController.clear();
                                    } else {
                                      if (_discountCodes
                                          .containsKey(_textController.text)) {
                                        _discountPercent = _discountCodes[
                                            _textController.text]!;
                                        _isDiscountApplied = true;
                                        viewmodel
                                            .updateDiscount(_discountPercent);
                                      } else {
                                        _textController.text = "Not Found";
                                      }
                                    }
                                  });
                                },
                                child: Text(
                                    _isDiscountApplied ? "Remove" : "Apply"),
                                style: TextButton.styleFrom(
                                  primary: _isDiscountApplied
                                      ? Colors.red
                                      : Colors.grey[800],
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
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25.0),
                  child: ShimmerButton(
                    buttonAction: () {
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
