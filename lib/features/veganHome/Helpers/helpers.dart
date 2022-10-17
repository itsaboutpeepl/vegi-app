import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

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

String mapPreviewImage({required double latitude, required double longitude}) {
  final _apiKey = Platform.isIOS
      ? dotenv.env['MAP_API_KEY_IOS'] ?? ''
      : dotenv.env['MAP_API_KEY_ANDROID'] ?? '';

  return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$_apiKey&style=feature:|element:|visibility:simplified';
}

String mapToString(Map<String, String> map) {
  final DateTime startTime = DateTime.parse(map.entries.first.value);
  final DateTime endTime = DateTime.parse(map.entries.last.value);

  return '${startTime.hour.toString()}:00 - ${endTime.hour.toString()}:00';
}

String mapToStringDate(Map<String, String> map) {
  final DateTime startTime = DateTime.parse(map.entries.first.value);
  final DateFormat formatter = DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY);
  return formatter.format(startTime);
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

List<Map<String, dynamic>> sanitizeOrdersList(Map<String, dynamic> orderObj) {
  //TODO: Clean this shit up, its so bad.
  try {
    final List<Map<String, dynamic>> listOfOrders = [];

    final List<Map<String, dynamic>> ordersListJson = orderObj['orders']
        as List<Map<String, dynamic>>
      ..forEach((Map<String, dynamic> singleOrder) {
        //Order Details
        final Map<String, dynamic> sanitizedOrderObject = {};

        sanitizedOrderObject['orderID'] = singleOrder['id'];
        sanitizedOrderObject['total'] = cFPrice(singleOrder['total'] as int);
        sanitizedOrderObject['orderedDateTime'] = formatDate(
          DateTime.fromMillisecondsSinceEpoch(
            singleOrder['orderedDateTime'] as int,
          ).toLocal(),
        );
        sanitizedOrderObject['deliveryName'] = singleOrder['deliveryName'];
        sanitizedOrderObject['deliveryEmail'] = singleOrder['deliveryEmail'];
        sanitizedOrderObject['deliveryPhoneNumber'] =
            singleOrder['deliveryPhoneNumber'];
        sanitizedOrderObject['deliveryAddressLineOne'] =
            singleOrder['deliveryAddressLineOne'];
        sanitizedOrderObject['deliveryAddressLineTwo'] =
            singleOrder['deliveryAddressLineTwo'];
        sanitizedOrderObject['deliveryAddressPostCode'] =
            singleOrder['deliveryAddressPostCode'];
        sanitizedOrderObject['paymentStatus'] =
            singleOrder['paymentStatus'].toString()[0].toUpperCase() +
                singleOrder['paymentStatus'].toString().substring(1);
        sanitizedOrderObject['rewardsIssued'] = singleOrder['rewardsIssued'];
        sanitizedOrderObject['restaurantName'] = singleOrder['vendor']['name'];
        sanitizedOrderObject['restaurantPhoneNumber'] =
            singleOrder['vendor']['phoneNumber'];
        sanitizedOrderObject['restaurantAccepted'] =
            singleOrder['restaurantAccepted'];
        sanitizedOrderObject['restaurantAcceptanceStatus'] =
            singleOrder['restaurantAcceptanceStatus'];
        sanitizedOrderObject['isCollection'] =
            singleOrder['fulfilmentMethod'] == 2;

        final List<Map<String, dynamic>> listOfProductsOrdered = [];

        //Products in Order
        final List<Map<String, dynamic>> productsOrderedListJson =
            singleOrder['items'] as List<Map<String, dynamic>>
              ..forEach((productItem) {
                final Map<String, dynamic> singleProductItem = {};
                singleProductItem['name'] = productItem['product']['name'];
                singleProductItem['basePrice'] =
                    cFPrice(productItem['product']['basePrice'] as int);

                //Options in Product
                if (productItem.containsKey('optionValues')) {
                  final List<Map<String, dynamic>> listOfChosenProductOptions =
                      [];

                  List<Map<String, dynamic>> productsOptionValuesListJson =
                      productItem['optionValues'] as List<Map<String, dynamic>>
                        ..forEach((productOption) {
                          //Add Options in Product to ListOfProductOptions.
                          listOfChosenProductOptions.add({
                            'name': productOption['option']['name'],
                            'chosenOption': productOption['optionValue']
                                ['name'],
                            'priceModifier': productOption['optionValue']
                                ['priceModifier'],
                          });
                        });
                  singleProductItem['options'] = listOfChosenProductOptions;
                }
                //Add SingleProductItem to listOfProductsOrdered, clear listOfProductOptions
                listOfProductsOrdered.add(singleProductItem);
              });
        sanitizedOrderObject['products'] = listOfProductsOrdered;
        listOfOrders.add(sanitizedOrderObject);
      });
    return listOfOrders;
  } catch (e) {
    throw Exception(e);
  }
}

bool isScheduledDelivery(Map<String, String> selectedSlot) {
  final DateTime startTime = DateTime.parse(selectedSlot.entries.first.value);
  if (startTime.difference(DateTime.now()).inHours > 5) {
    return true;
  } else {
    return false;
  }
}

bool shouldEndOngoing(Map<String, String> selectedSlot) {
  final DateTime endTime = DateTime.parse(selectedSlot.entries.last.value);
  if (endTime.isBefore(DateTime.now())) {
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
    default:
      return 'Something went wrong!';
  }
}

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}

extension CapitalizeString on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
