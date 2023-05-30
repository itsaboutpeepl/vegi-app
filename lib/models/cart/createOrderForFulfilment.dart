import 'dart:math';

import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForCollection.dart';
import 'package:vegan_liverpool/models/cart/createOrderForDelivery.dart';
import 'package:vegan_liverpool/models/cart/createOrderForInStorePayment.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

abstract class CreateOrderForFulfilment {
  CreateOrderForFulfilment();

  static T? fromStore<T extends CreateOrderForFulfilment>(
    Store<AppState> store,
  ) {
    try {
      if (store.state.cartState.isDelivery) {
        return CreateOrderForDelivery.fromStore(store) as T;
      } else if (store.state.cartState.isCollection) {
        return CreateOrderForCollection.fromStore(store) as T;
      } else if (store.state.cartState.isCollection) {
        return CreateOrderForInStorePayment.fromStore(store) as T;
      } else {
        throw Exception(
          'Unknown order fulfilment type passed to CreateOrderForFulfilment.fromStore',
        );
      }
    } on Exception catch (e, s) {
      log.error(e);
      Sentry.captureException(
        e,
        stackTrace: s, // from catch (e, s)
        hint: 'ERROR Deserialization - CreateOrderForFulfilment.fromJson $e',
      );
      return null;
    }
  }

  abstract final FulfilmentMethodType fulfilmentTypeString;

  static T? fromJson<T extends CreateOrderForFulfilment>(
    Map<String, dynamic> json,
  ) {
    try {
      if (json.containsKey('isDelivery') && json['isDelivery'] == true) {
        return CreateOrderForDelivery.fromJson(json) as T;
      } else if (json.containsKey('fulfilmentTypeString')) {
        final fmType = EnumHelpers.enumFromString(
          FulfilmentMethodType.values,
          json['fulfilmentTypeString'] as String,
        );
        switch (fmType) {
          case FulfilmentMethodType.collection:
            return CreateOrderForCollection.fromJson(json) as T;
          case FulfilmentMethodType.delivery:
            return CreateOrderForDelivery.fromJson(json) as T;
          case FulfilmentMethodType.inStore:
            return CreateOrderForInStorePayment.fromJson(json) as T;
          case FulfilmentMethodType.none:
          case null:
            throw Exception(
              'Unknown order fulfilment type (`FulfilmentMethodType.none`) received in json passed to CreateOrderForFulfilment.fromJson',
            );
        }
      }
    } on Exception catch (e, s) {
      log.error(e);
      Sentry.captureException(
        e,
        stackTrace: s, // from catch (e, s)
        hint: 'ERROR Deserialization - CreateOrderForFulfilment.fromJson $e',
      );
      return null;
    }
  }

  // CreateOrderForFulfilment({
  //   required this.items,
  //   required this.total,
  //   required this.tipAmount,
  //   required this.marketingOptIn,
  //   required this.discountCode,
  //   required this.vendor,
  //   required this.walletAddress,
  //   required this.address,
  //   required this.fulfilmentMethod,
  //   required this.fulfilmentSlotFrom,
  //   required this.fulfilmentSlotTo,
  // });

  late final List<CartItem> items;
  late final num total;
  late final Currency currency;
  late final int tipAmount;
  late final bool marketingOptIn;
  late final List<String> discountCodes;
  late final String vendor;
  late final String walletAddress;
  late final DeliveryAddresses address;
  late final int fulfilmentMethod;
  late final String fulfilmentSlotFrom;
  late final String fulfilmentSlotTo;
  late final bool isDelivery;
  late final String publicId;

  @override
  String toString() {
    final dm = isDelivery ? 'delivery' : 'collection';
    return 'CreateOrderFor$dm -> $total -> $vendor [$fulfilmentSlotFrom]';
  }

  Future<Map<String, dynamic>> toUploadJson() async {
    return {}
      ..addAll({
        'items': items
            .map(
              (e) => {
                'id': int.parse(e.menuItem.menuItemID),
                'quantity': e.itemQuantity,
                'options': e.selectedProductOptions.map(
                  (key, value) =>
                      MapEntry<String, int>(key.toString(), value.optionID),
                ),
              },
            )
            .toList(),
        'total': total,
        'currency': currency.name,
        'tipAmount': tipAmount,
        'marketingOptIn': marketingOptIn,
        'discountCodes': discountCodes,
        'vendor': vendor,
        'walletAddress': walletAddress,
        'isDelivery': isDelivery,
        'firebaseRegistrationToken': await firebaseMessaging.getToken(),
      })
      ..addAll(
        {
          'address': {
            'lineOne': address.addressLine1,
            'lineTwo': address.addressLine2,
            'city': address.townCity,
            'postCode': address.postalCode,
            'deliveryInstructions': address.instructions,
            'name': address.name,
            'email': address.email,
            'phoneNumber': address.phoneNumber,
            'label': address.label.name,
            'latitude': address.latitude,
            'longitude': address.longitude,
          },
          'fulfilmentMethod': fulfilmentMethod,
          'fulfilmentSlotFrom': fulfilmentSlotFrom,
          'fulfilmentSlotTo': fulfilmentSlotTo
        },
      );
  }

  static Future<CreateOrderForFulfilment> fromUploadJsonWithFetchedItems(
    Map<String, dynamic> json,
    List<CartItem> items,
  ) async {
    return CreateOrderForCollection(
      items: items,
      total: json['total']! as int,
      currency: EnumHelpers.enumFromString(
            Currency.values,
            (json['currency'] ?? '') as String,
          ) ??
          Currency.GBP,
      tipAmount: json['tipAmount']! as int,
      marketingOptIn: json['marketingOptIn']! as bool,
      discountCodes: (json['discountCodes'] ?? <String>[]) as List<String>,
      vendor: json['vendor']! as String,
      walletAddress: json['walletAddress']! as String,
      isDelivery: json['isDelivery']! as bool,
      address: DeliveryAddresses.fromCartJson(
        json['address'] as Map<String, dynamic>,
      ),
      fulfilmentMethod: json['fulfilmentMethod']! as int,
      fulfilmentSlotFrom: json['fulfilmentSlotFrom']! as String,
      fulfilmentSlotTo: json['fulfilmentSlotTo']! as String,
      publicId: json['publicId'] as String,
    );
  }
}
