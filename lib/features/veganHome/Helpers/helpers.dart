import 'dart:io';
import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/restaurant/ESCRating.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/utils/config.dart' as VEGI_CONFIG;
import 'package:vegan_liverpool/utils/log/log.dart';

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

DateTime toTS(int json) => json.toTimeStamp();
DateTime? toTSNullable(int? json) => json?.toTimeStamp();

int objectIdFromJson(dynamic obj) {
  if (obj is int) {
    return obj;
  }
  if (obj is Map) {
    if (obj.containsKey('id')) {
      return obj['id'] as int;
    }
  }
  throw Exception('unable to cast json object to int');
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

const pplRewardsPcntDelivery = 0.05;
const pplRewardsPcntPoS = 0.01;
const pplPenceValue = 0.1;
const pplPoundValue = pplPenceValue / 100;
const minESCRating = 0.0;
const maxESCRating = 5.0;

double getPPLValueFromPence(num penceAmount) {
  return penceAmount * pplPenceValue;
}

double getPPLValueFromPounds(num poundAmount) {
  return poundAmount * pplPoundValue;
}

double getPoundValueFromPPL(num pplAmount) {
  return pplAmount / pplPoundValue;
}

double getPPLRewardsFromPence(num penceAmount) {
  return getPPLValueFromPence(penceAmount * pplRewardsPcntDelivery);
}

int calculateRewardsForPrice({
  required num penceAmount,
  required ESCRating? rating,
  required FulfilmentMethodType fulfilmentMethod,
}) {
  return ((Math.max(Math.min(rating?.rating ?? 0, maxESCRating), minESCRating) /
              maxESCRating) *
          penceAmount *
          (fulfilmentMethod == FulfilmentMethodType.inStore
              ? pplRewardsPcntPoS
              : pplRewardsPcntDelivery))
      .floor();
  // return penceAmount * (fulfilmentMethod == FulfilmentMethodType.inStore ? 1 : 5) ~/ 100;
}

double calculateCartRewardsForPrice({
  required Iterable<CartItem> items,
  required FulfilmentMethodType fulfilmentMethod,
}) {
  final x = items.map(
    (item) {
      return (Math.max(
                  Math.min(item.menuItem.rating?.rating ?? 0, maxESCRating),
                  minESCRating) /
              maxESCRating) *
          item.totalItemPrice *
          (fulfilmentMethod == FulfilmentMethodType.inStore
              ? pplRewardsPcntPoS
              : pplRewardsPcntDelivery);
    },
  ).reduce((value, element) => value + element);
  return x;
}

double calculateRewardsForOrder(CreateOrderForFulfilment order) {
  return calculateCartRewardsForPrice(
    items: order.items,
    fulfilmentMethod: order.fulfilmentTypeString,
  );
}

String getPoundValueFormattedFromPPL(num pplAmount) {
  return getPPLValueFromPence(pplAmount).toStringAsFixed(2);
}

UpdateTotalPrice calculateMenuItemPrice({
  required RestaurantMenuItem menuItem,
  required int quantity,
  bool inStore = false,
  Iterable<ProductOptions> productOptions = const [],
}) {
  var total = quantity * menuItem.price;

  productOptions.forEach((element) {
    total += element.price;
  });

  return UpdateTotalPrice(
    totalPrice: total,
    totalRewards: total *
        (inStore ? pplRewardsPcntPoS : pplRewardsPcntDelivery).truncate(),
  );
}

UpdateComputedCartValues? computeTotalsFromCart({
  required List<CartItem> cartItems,
  required int fulfilmentCharge,
  required int platformFee,
  required int cartDiscountPercent,
  required int cartTip,
}) {
  try {
    int cartSubTotal = 0;
    const int cartTax = 0;
    int cartTotal = 0;
    int cartDiscountComputed = 0;

    for (final element in cartItems) {
      cartSubTotal += element.totalItemPrice;
    }

    cartDiscountComputed =
        (cartSubTotal * cartDiscountPercent) ~/ 100; // subtotal * discount

    cartTotal =
        (cartSubTotal + cartTax + cartTip + fulfilmentCharge + platformFee) -
            cartDiscountComputed;

    if (cartItems.isEmpty) {
      cartSubTotal = 0;
      cartTotal = 0;
      cartDiscountComputed = 0;
    }

    return UpdateComputedCartValues(
      cartSubTotal,
      cartTax,
      cartTotal,
      cartDiscountComputed,
    );
  } catch (e, s) {
    log.error('ERROR - computeCartTotals $e');
    Sentry.captureException(
      e,
      stackTrace: s,
      hint: 'ERROR - computeCartTotals $e',
    );
    return null;
  }
}

num fxAmount({
  required num amount,
  required Currency fromCurrency,
  Currency toCurrency = Currency.GBP,
}) {
  var amountGBP = amount; // DEFAULT GBP CASE
  if (fromCurrency == Currency.EUR || fromCurrency == Currency.USD) {
    throw Exception(
        'Not implemented cart totals for fromCurrency: $fromCurrency');
  } else if (fromCurrency == Currency.GBPx) {
    amountGBP = amount * 100;
  } else if (fromCurrency == Currency.PPL) {
    amountGBP = getPoundValueFromPPL(amount);
  } else if (fromCurrency == Currency.GBP) {
    amountGBP = amount;
  } else if (fromCurrency == Currency.GBT) {
    throw Exception(
        'Not implemented cart totals for fromCurrency: $fromCurrency');
  }

  if (toCurrency == Currency.EUR ||
      toCurrency == Currency.USD ||
      toCurrency == Currency.GBT) {
    throw Exception('Not implemented cart totals for toCurrency: $toCurrency');
  } else if (toCurrency == Currency.GBPx) {
    return amountGBP * 100;
  } else if (toCurrency == Currency.PPL) {
    return getPPLValueFromPounds(amountGBP);
  } else if (toCurrency == Currency.GBP) {
    return amountGBP;
  } else {
    throw Exception('Not implemented cart totals for toCurrency: $toCurrency');
  }
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
