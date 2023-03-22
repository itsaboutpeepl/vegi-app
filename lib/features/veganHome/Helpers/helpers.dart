import 'dart:io';
import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/utils/config.dart' as VEGI_CONFIG;

String cFPrice(int price) {
  //isPence ? price = price ~/ 100 : price;
  return '£${(price / 100).toStringAsFixed(2)}';
}

String cFPriceNoDec(int price) {
  //isPence ? price = price ~/ 100 : price;
  return '£${(price / 100).toStringAsFixed(0)}';
}

Color? colorForESCRating(num rating) {
  if (rating > 4) {
    return Colors.greenAccent[500];
  } else if (rating > 3) {
    return Colors.greenAccent[300];
  } else if (rating > 2) {
    return Colors.greenAccent[100];
  } else if (rating > 1) {
    return Colors.amberAccent[100];
  } else if (rating > 0) {
    return Colors.amberAccent[200];
  } else {
    return Colors.orangeAccent[400];
  }
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
  if (selectedSlot.startTime.difference(DateTime.now()).inHours >
      VEGI_CONFIG.ONGOING_ORDERS_COUNTDOWN_HOURS) {
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

UpdateTotalPrice calculateMenuItemPrice({
  required RestaurantMenuItem menuItem,
  required int quantity,
  Iterable<ProductOptions> productOptions = const [],
}) {
  var total = quantity * menuItem.price;

  productOptions.forEach((element) {
    total += element.price;
  });

  return UpdateTotalPrice(
    totalPrice: total,
    totalRewards: total * 5 ~/ 100,
  );
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

Future<String> getFileSizeDescriptor(File file, int decimals) async {
  final bytes = await file.length();
  if (bytes <= 0) return '0 B';
  const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  final i = (Math.log(bytes) / Math.log(1024)).floor();
  return '${(bytes / Math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

double getFileSizeMB(File? file) => (file?.lengthSync() ?? 0) / (1024 * 1024);

double triangleArea(
  Offset p1,
  Offset p2,
  Offset p3,
) =>
    0.5 *
    ((p1.dx * (p2.dy - p3.dy)) +
        (p2.dx * (p3.dy - p1.dy)) +
        (p3.dx * (p1.dy - p2.dy)));

double rectArea(
  Offset p1,
  Offset p2,
  Offset p3,
  Offset p4,
) =>
    triangleArea(p1, p2, p3) + triangleArea(p2, p3, p4);
