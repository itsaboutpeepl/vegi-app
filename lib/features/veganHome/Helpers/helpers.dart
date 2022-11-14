import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';

String cFPrice(int price) {
  //isPence ? price = price ~/ 100 : price;
  return '£${(price / 100).toStringAsFixed(2)}';
}

String cFPriceNoDec(int price) {
  //isPence ? price = price ~/ 100 : price;
  return '£${(price / 100).toStringAsFixed(0)}';
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

double parseBalance(String balance) {
  return double.parse(balance.replaceAll('<', '').replaceAll(',', ''));
}

String formatDateForOrderObject(String date) {
  return date.replaceFirst('T', ' ').replaceFirst('.000Z', '');
}

String formatDate(DateTime dateToFormat) {
  final DateFormat formatter = DateFormat('HH:mm - EEE, dd MMM');

  return formatter.format(dateToFormat);
}

String formatDateForCalendar(DateTime dateToFormat) {
  final DateFormat formatter = DateFormat('EEE, dd MMM');

  return formatter.format(dateToFormat);
}

bool isScheduledDelivery(TimeSlot selectedSlot) {
  if (selectedSlot.startTime.difference(DateTime.now()).inHours > 5) {
    return true;
  } else {
    return false;
  }
}

bool shouldEndOngoing(TimeSlot selectedSlot) {
  if (selectedSlot.endTime.isBefore(DateTime.now())) {
    return true;
  } else {
    return false;
  }
}

double getPPLValueFromPence(num penceAmount) {
  return penceAmount / 10;
}

double getPPLRewardsFromPence(num penceAmount) {
  return getPPLValueFromPence((penceAmount * 5) / 100);
}

String getPoundValueFromPPL(num pplAmount) {
  return (pplAmount / 10).toStringAsFixed(2);
}

// Conversion
// 1000GBP => 100,000 => 10,000 PPL Tokens
// 1GBP => 100 pence => 10 PPL tokens

// Reward Conversion Rate (5% reward)
// 1GBP => 100 pence => 5 pence => 0.5 PPL
// 1000GBP => 100,000 pence => 5000 pence => 500 PPL Tokens

String getErrorMessageForOrder(String errorCode) {
  switch (errorCode) {
    case 'invalidVendor':
      return 'This vendor is currently not delivering!';
    case 'invalidFulfilmentMethod':
      return 'This vendor is not currently accepting delivery/collection orders';
    case 'invalidProduct':
      return 'This product is not currently avaliable!';
    case 'invalidProductOption':
      return 'This option is not currently avaliable!';
    case 'invalidPostalDistrict':
      return 'The vendor does not delivery to this location, sorry!';
    case 'invalidSlot':
      return 'This slot is full. Please choose another slot!';
    case 'invalidDiscountCode':
      return 'The discount code entered is invalid, sorry!';
    case 'invalidUserAddress':
      return 'The address entered is invalid, sorry!';
    default:
      return 'Something went wrong: $errorCode';
  }
}
