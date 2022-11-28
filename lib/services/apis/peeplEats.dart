import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/productCategory.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/services/apis/places.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

@lazySingleton
class PeeplEatsService {
  PeeplEatsService(this.dio) {
    dio.options.baseUrl = dotenv.env['VEGI_EATS_BACKEND']!;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  final Dio dio;

  Future<List<RestaurantItem>> featuredRestaurants(String outCode) async {
    final Response<dynamic> response =
        await dio.get<dynamic>('api/v1/vendors?outcode=$outCode').timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return Response(
          data: {'vendors': List<RestaurantItem>.empty()},
          requestOptions: RequestOptions(path: ''),
        );
      },
    ).onError(
      (error, stackTrace) => Response(
        data: {'vendors': List<RestaurantItem>.empty()},
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final List<Map<String, dynamic>> results =
        List.from(response.data['vendors'] as Iterable<dynamic>);

    final List<RestaurantItem> restaurantsActive = [];

    for (final Map<String, dynamic> element in results) {
      if (element['status'] == 'active') {
        final List<Map<String, dynamic>> postalCodes = List.from(
          element['fulfilmentPostalDistricts'] as Iterable<dynamic>,
        );

        final List<String> deliversTo = [];

        for (final element in postalCodes) {
          deliversTo.add((element['outcode'] as String? ?? '').toUpperCase());
        }

        restaurantsActive.add(
          RestaurantItem(
            restaurantID: element['id'].toString(),
            name: element['name'] as String? ?? '',
            description: element['description'] as String? ?? '',
            phoneNumber: element['phoneNumber'] as String? ?? '',
            status: element['status'] as String? ?? 'draft',
            deliveryRestrictionDetails: deliversTo,
            imageURL: element['imageUrl'] as String? ?? '',
            category: 'Category',
            costLevel: element['costLevel'] as int? ?? 2,
            rating: element['rating'] as int? ?? 2,
            address: DeliveryAddresses.fromVendorJson(element),
            walletAddress: element['walletAddress'] as String? ?? '',
            listOfMenuItems: [],
            productCategories: [],
            isVegan: element['isVegan'] as bool? ?? false,
            minimumOrderAmount: element['minimumOrderAmount'] as int? ?? 0,
            platformFee: element['platformFee'] as int? ?? 0,
          ),
        );
      }
    }

    return restaurantsActive;
  }

  Future<List<RestaurantItem>> getRestaurantsByLocation({
    required Coordinates geoLocation,
    required num distanceFromLocationAllowedInKm,
  }) async {
    final Response<dynamic> response = await dio
        .get<dynamic>(
            'api/v1/vendors?location=${geoLocation.lat},${geoLocation.lng}&distance=$distanceFromLocationAllowedInKm')
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return Response(
          data: {'vendors': List<RestaurantItem>.empty()},
          requestOptions: RequestOptions(path: ''),
        );
      },
    ).onError(
      (error, stackTrace) => Response(
        data: {'vendors': List<RestaurantItem>.empty()},
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final List<Map<String, dynamic>> results =
        List.from(response.data['vendors'] as Iterable<dynamic>);

    final List<RestaurantItem> restaurantsActive = [];

    for (final Map<String, dynamic> element in results) {
      if (element['status'] == 'active') {
        final List<Map<String, dynamic>> postalCodes = List.from(
          element['fulfilmentPostalDistricts'] as Iterable<dynamic>,
        );

        final List<String> deliversTo = [];

        for (final element in postalCodes) {
          deliversTo.add((element['outcode'] as String? ?? '').toUpperCase());
        }

        restaurantsActive.add(
          RestaurantItem(
            restaurantID: element['id'].toString(),
            name: element['name'] as String? ?? '',
            description: element['description'] as String? ?? '',
            phoneNumber: element['phoneNumber'] as String? ?? '',
            status: element['status'] as String? ?? 'draft',
            deliveryRestrictionDetails: deliversTo,
            imageURL: element['imageUrl'] as String? ?? '',
            category: 'Category',
            costLevel: element['costLevel'] as int? ?? 2,
            rating: element['rating'] as int? ?? 2,
            address: DeliveryAddresses.fromVendorJson(element),
            walletAddress: element['walletAddress'] as String? ?? '',
            listOfMenuItems: [],
            productCategories: [],
            isVegan: element['isVegan'] as bool? ?? false,
            minimumOrderAmount: element['minimumOrderAmount'] as int? ?? 0,
            platformFee: element['platformFee'] as int? ?? 0,
          ),
        );
      }
    }

    return restaurantsActive;
  }

  Future<List<RestaurantItem>> getFilteredRestaurants({
    required String outCode,
    required String globalSearchQuery,
  }) async {
    final Response<dynamic> response = await dio
        .get<dynamic>(
            'api/v1/vendors?outcode=$outCode&search=$globalSearchQuery')
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return Response(
          data: {'vendors': List<RestaurantItem>.empty()},
          requestOptions: RequestOptions(path: ''),
        );
      },
    ).onError(
      (error, stackTrace) => Response(
        data: {'vendors': List<RestaurantItem>.empty()},
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final List<Map<String, dynamic>> results =
        List.from(response.data['vendors'] as Iterable<dynamic>);

    final List<RestaurantItem> restaurantsActive = [];

    for (final Map<String, dynamic> element in results) {
      if (element['status'] == 'active') {
        final List<Map<String, dynamic>> postalCodes = List.from(
          element['fulfilmentPostalDistricts'] as Iterable<dynamic>,
        );

        final List<String> deliversTo = [];

        for (final element in postalCodes) {
          deliversTo.add((element['outcode'] as String? ?? '').toUpperCase());
        }

        restaurantsActive.add(
          RestaurantItem(
            restaurantID: element['id'].toString(),
            name: element['name'] as String? ?? '',
            description: element['description'] as String? ?? '',
            phoneNumber: element['phoneNumber'] as String? ?? '',
            status: element['status'] as String? ?? 'draft',
            deliveryRestrictionDetails: deliversTo,
            imageURL: element['imageUrl'] as String? ?? '',
            category: 'Category',
            costLevel: element['costLevel'] as int? ?? 2,
            rating: element['rating'] as int? ?? 2,
            address: DeliveryAddresses.fromVendorJson(element),
            walletAddress: element['walletAddress'] as String? ?? '',
            listOfMenuItems: [],
            productCategories: [],
            isVegan: element['isVegan'] as bool? ?? false,
            minimumOrderAmount: element['minimumOrderAmount'] as int? ?? 0,
            platformFee: element['platformFee'] as int? ?? 0,
          ),
        );
      }
    }

    return restaurantsActive;
  }

  Future<List<RestaurantMenuItem>> getRestaurantMenuItems(
    String restaurantID,
  ) async {
    final Response<dynamic> response =
        await dio.get('api/v1/vendors/$restaurantID?');

    final List<Map<String, dynamic>> results =
        List.from(response.data['vendor']['products'] as Iterable<dynamic>);

    final List<RestaurantMenuItem> menuItems = [];

    for (final Map<String, dynamic> element in results) {
      if (element['isAvailable'] as bool) {
        menuItems.add(
          RestaurantMenuItem(
            isFeatured: element['isFeatured'] as bool? ?? false,
            menuItemID: element['id'].toString(),
            restaurantID: restaurantID,
            name: element['name'] as String? ?? '',
            imageURL: element['imageUrl'] as String? ?? '',
            categoryName: element['category']['name'] as String? ?? '',
            categoryId: element['category']['id'] as int? ?? 0,
            price: element['basePrice'] as int? ?? 0,
            description: element['description'] as String? ?? '',
            extras: {},
            listOfProductOptions: [],
            priority: element['priority'] as int? ?? 0,
          ),
        );
      }
    }

    menuItems.sort((a, b) => a.priority.compareTo(b.priority));

    return menuItems;
  }

  Future<List<RestaurantMenuItem>> getFilteredRestaurantMenu({
    required String restaurantID,
    required String searchQuery,
  }) async {
    final Response<dynamic> response =
        await dio.get('api/v1/vendors/$restaurantID?search=$searchQuery');

    final List<Map<String, dynamic>> results =
        List.from(response.data['vendor']['products'] as Iterable<dynamic>);

    final List<RestaurantMenuItem> menuItems = [];

    for (final Map<String, dynamic> element in results) {
      if (element['isAvailable'] as bool) {
        menuItems.add(
          RestaurantMenuItem(
            isFeatured: element['isFeatured'] as bool? ?? false,
            menuItemID: element['id'].toString(),
            restaurantID: restaurantID,
            name: element['name'] as String? ?? '',
            imageURL: element['imageUrl'] as String? ?? '',
            categoryName: element['category']['name'] as String? ?? '',
            categoryId: element['category']['id'] as int? ?? 0,
            price: element['basePrice'] as int? ?? 0,
            description: element['description'] as String? ?? '',
            extras: {},
            listOfProductOptions: [],
            priority: element['priority'] as int? ?? 0,
          ),
        );
      }
    }

    menuItems.sort((a, b) => a.priority.compareTo(b.priority));

    return menuItems;
  }

  Future<List<ProductCategory>> getProductCategoriesForVendor(
    int vendorId,
  ) async {
    final Response<dynamic> response = await dio
        .get('api/v1/vendors/view-product-categories?vendor=$vendorId');

    final List<dynamic> productCategories =
        response.data['productCategories'] as List<dynamic>;

    return productCategories
        .map(
          (e) => ProductCategory.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<List<ProductOptionsCategory>> getProductOptions(String itemID) async {
    final Response<dynamic> response =
        await dio.get('api/v1/products/get-product-options/$itemID?');

    final List<Map<String, dynamic>> results =
        List.from(response.data as Iterable<dynamic>);

    final List<ProductOptionsCategory> listOfProductOptions = [];

    for (final Map<String, dynamic> category in results) {
      final List<ProductOptions> listOfOptions = [];

      final List<Map<String, dynamic>> options =
          List.from(category['values'] as Iterable<dynamic>);

      for (final Map<String, dynamic> option in options) {
        listOfOptions.add(ProductOptions.fromJson(option));
      }

      if (options.isEmpty) continue;

      listOfProductOptions.add(
        ProductOptionsCategory(
          categoryID: category['id'] as int? ?? 0,
          name: category['name'] as String? ?? '',
          listOfOptions: listOfOptions,
        ),
      );
    }

    return listOfProductOptions;
  }

  Future<int> checkDiscountCode(String discountCode) async {
    final Response<dynamic> response =
        await dio.get('api/v1/discounts/check-discount-code/$discountCode?');

    final Map<dynamic, dynamic> results = response.data['discount'] as Map;

    return results['percentage'] as int? ?? 0;
  }

  Future<Map<String, List<TimeSlot>>> getFulfilmentSlots({
    required String vendorID,
    required String dateRequired,
  }) async {
    final Response<dynamic> response = await dio.get(
      'api/v1/vendors/get-fulfilment-slots?vendor=$vendorID&date=$dateRequired',
    );

    final List<dynamic> availableSlots =
        response.data['slots'] as List<dynamic>;

    final List<TimeSlot> collectionSlots = [];
    final List<TimeSlot> deliverySlots = [];

    for (final slot in availableSlots) {
      if (slot['fulfilmentMethod']['methodType'] == 'delivery') {
        deliverySlots.add(TimeSlot.fromJsonApi(slot as Map<String, dynamic>));
      } else {
        collectionSlots.add(TimeSlot.fromJsonApi(slot as Map<String, dynamic>));
      }
    }

    return {'collectionSlots': collectionSlots, 'deliverySlots': deliverySlots};
  }

  Future<List<String>> getAvaliableDates({
    required String vendorID,
    required bool isDelivery,
  }) async {
    final Response<dynamic> response = await dio
        .get('api/v1/vendors/get-eligible-order-dates?vendor=$vendorID');

    final Map<String, dynamic> collectionDates =
        response.data['collection'] as Map<String, dynamic>;
    final Map<String, dynamic> deliveryDates =
        response.data['delivery'] as Map<String, dynamic>;

    if (isDelivery) {
      return List<String>.from(deliveryDates.keys);
    } else {
      return List<String>.from(collectionDates.keys);
    }
  }

  Future<Map<String, TimeSlot?>> getNextAvaliableSlot({
    required String vendorID,
  }) async {
    final Response<dynamic> response = await dio.get(
      'api/v1/vendors/get-next-fulfilment-slot?vendor=$vendorID',
    );

    final Map<String, dynamic> collectionSlotJson =
        response.data['slot']['collection'] as Map<String, dynamic>? ?? {};
    final Map<String, dynamic> deliverySlotJson =
        response.data['slot']['delivery'] as Map<String, dynamic>? ?? {};

    final Map<String, TimeSlot?> nextSlots = {};

    if (collectionSlotJson.isNotEmpty) {
      final TimeSlot collectionSlot = TimeSlot.fromJsonApi(collectionSlotJson);
      nextSlots['collectionSlot'] = collectionSlot;
    } else {
      nextSlots['collectionSlot'] = null;
    }
    if (deliverySlotJson.isNotEmpty) {
      final TimeSlot deliverySlot = TimeSlot.fromJsonApi(deliverySlotJson);
      nextSlots['deliverySlot'] = deliverySlot;
    } else {
      nextSlots['deliverySlot'] = null;
    }

    return nextSlots;
  }

  Future<void> registerEmailToWaitingList(
    String email,
    void Function() onSuccess,
    void Function(String error) onError,
  ) async {
    final Response<dynamic> response = await dio.post(
      '/api/v1/admin/register-email-to-waiting-list',
      data: {
        'emailAddress': email,
        'origin': kIsWeb ? 'guide' : 'mobile',
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
    } else {
      onSuccess();
    }

    return;
  }

  Future<void> submitSurveyResponse(
    String email,
    String question,
    String answer,
    void Function() onSuccess,
    void Function(String error) onError,
  ) async {
    final Response<dynamic> response = await dio.post(
      '/api/v1/admin/submit-survey-response',
      data: {
        'emailAddress': email,
        'question': question,
        'answer': answer,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
    } else {
      onSuccess();
    }

    return;
  }

  Future<List<String>> getSurveyQuestions() async {
    final Response<dynamic> response = await dio.get(
      '/api/v1/admin/get-survey-questions',
    );

    return (response.data as List<dynamic>)
        .map((question) => question['question'] as String)
        .toList();
  }

  Future<Map<String, dynamic>> createOrder<T extends CreateOrderForFulfilment>(
    T orderObject,
  ) async {
    final Response<dynamic> response = await dio
        .post('/api/v1/orders/create-order', data: orderObject.toJson());

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    return result;
  }

  Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID) async {
    final Response<dynamic> response =
        await dio.get('/api/v1/orders/get-order-status?orderId=$orderID');

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    return result;
  }

  Future<List<Order>> getPastOrders(String walletAddress) async {
    try {
      final Response<dynamic> response =
          await dio.get('/api/v1/orders?walletId=$walletAddress');
      return (response.data['orders'] as List<dynamic>)
          .map((order) => Order.fromJson(order as Map<String, dynamic>))
          .toList();
    } catch (e, stackTrace) {
      log.error(
        'Order parsing threw with stackTrace: $stackTrace & error: $e',
      );
      throw Exception(e);
    }
  }

  Future<List<String>> getPostalCodes() async {
    final Response<dynamic> response =
        await dio.get('api/v1/postal-districts/get-all-postal-districts');

    final List<String> outCodes = [];

    final List<Map<String, dynamic>> data =
        List.from(response.data['postalDistricts'] as Iterable<dynamic>);

    for (final Map<String, dynamic> outcode in data) {
      outCodes.add((outcode['outcode'] as String? ?? '').toUpperCase());
    }

    return outCodes;
  }
}
