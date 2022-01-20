import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/addressCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/paymentSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/pickUpCard.dart';

List<String> _listOfTimings = [
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
  int _value = 1;
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
    return Scaffold(
      appBar: CustomAppBar(
        centerText: "",
        pageTitle: "Checkout",
        hasSearchAction: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return index == 0 ? PickUpCard() : AddressCard();
                },
                itemCount: 3,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${_typeOfScheduling} Scheduling",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            Row(
              children: [
                ChoiceChip(
                  label: Text(
                    "ASAP",
                    style: TextStyle(),
                  ),
                  selected: !_isScheduledDelivery,
                  selectedColor: Colors.yellow[200],
                  onSelected: (value) {
                    setState(() {
                      _isScheduledDelivery = false;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ChoiceChip(
                  label: Text(
                    "Scheduled",
                    style: TextStyle(),
                  ),
                  selected: _isScheduledDelivery,
                  selectedColor: Colors.yellow[100],
                  onSelected: (value) {
                    setState(() {
                      _isScheduledDelivery = true;
                    });
                  },
                ),
              ],
            ),
            _isScheduledDelivery
                ? Wrap(
                    children: List<Widget>.generate(
                      _listOfTimings.length,
                      (int index) {
                        return Padding(
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
                        );
                      },
                    ).toList(),
                  )
                : SizedBox.shrink(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount Code",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 50,
                ),
                _isDiscountApplied
                    ? Text(
                        "${_textController.text} Applied, -${_discountPercent.toString()}%",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      )
                    : Expanded(
                        child: TextField(
                          controller: _textController,
                          onSubmitted: (key) {
                            if (_discountCodes.containsKey(key)) {
                              setState(() {
                                _discountPercent = _discountCodes[key]!;
                                _isDiscountApplied = true;
                              });
                            } else {
                              _textController.text = "Not Found";
                            }
                          },
                          maxLength: 20,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            fillColor: Colors.transparent,
                            isDense: true,
                          ),
                        ),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 35.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  onPrimary: Colors.grey[800],
                  primary: Colors.yellow[300],
                  shadowColor: Colors.yellow,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Pay',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\£59.65',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
