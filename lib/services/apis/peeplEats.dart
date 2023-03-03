import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/admin/surveyQuestion.dart';
import 'package:vegan_liverpool/models/admin/uploadProductSuggestionImageResponse.dart';
import 'package:vegan_liverpool/models/cart/createOrderForDelivery.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/cart/productSuggestion.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/productCategory.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/services/abstract_apis/httpService.dart';
import 'package:vegan_liverpool/services/apis/places.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

@lazySingleton
class PeeplEatsService extends HttpService {
  PeeplEatsService(Dio dio) : super(dio, dotenv.env['VEGI_EATS_BACKEND']!) {
    dio.options.baseUrl = dotenv.env['VEGI_EATS_BACKEND']!;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  RestaurantItem _vendorJsonToRestaurantItem(Map<String, dynamic> element) {
    final List<Map<String, dynamic>> postalCodes = List.from(
      element['fulfilmentPostalDistricts'] as Iterable<dynamic>,
    );

    final List<String> deliversTo = [];

    for (final element in postalCodes) {
      deliversTo.add((element['outcode'] as String? ?? '').toUpperCase());
    }

    return RestaurantItem(
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
    );
  }

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
    ).onError((error, stackTrace) {
      log.error(error, stackTrace: stackTrace);
      if ((error as Map<String, dynamic>)['message']
              .toString()
              .startsWith('SocketException:') &&
          dio.options.baseUrl.startsWith('http://localhost')) {
        log.warn(
            'If running from real_device, cant connect to localhost on running machine...');
      }
      return Response(
        data: {'vendors': List<RestaurantItem>.empty()},
        requestOptions: RequestOptions(path: ''),
      );
    });

    final List<Map<String, dynamic>> results =
        List.from(response.data['vendors'] as Iterable<dynamic>);

    final List<RestaurantItem> restaurantsActive = [];

    for (final Map<String, dynamic> element in results) {
      if (element['status'] == 'active') {
        restaurantsActive.add(
          _vendorJsonToRestaurantItem(element),
        );
      }
    }

    return restaurantsActive;
  }

  Future<RestaurantItem?> fetchSingleRestaurant({
    required int restaurantID,
  }) async {
    final Response<dynamic> response = await dioGet<dynamic>(
      'api/v1/vendors/$restaurantID',
    ).onError((error, stackTrace) {
      log.error(error, stackTrace: stackTrace);
      return Response(
        data: {'vendor': null},
        requestOptions: RequestOptions(path: ''),
      );
    });

    final element = response.data['vendor'] as Map<String, dynamic>?;

    if (element != null) {
      return _vendorJsonToRestaurantItem(element);
    } else {
      return null;
    }
  }

  Future<List<RestaurantItem>> getRestaurantsByLocation({
    required Coordinates geoLocation,
    required num? distanceFromLocationAllowedInKm,
    required FulfilmentMethodType fulfilmentMethodTypeName,
  }) async {
    final distanceFromQueryParam = distanceFromLocationAllowedInKm == null
        ? ''
        : '&distance=$distanceFromLocationAllowedInKm';
    final fulfilmentMethodType =
        fulfilmentMethodTypeName != FulfilmentMethodType.none
            ? fulfilmentMethodTypeName.name
            : FulfilmentMethodType.collection.name;
    final Response<dynamic> response = await dio
        .get<dynamic>(
      'api/v1/home/nearest-vendors?location=${geoLocation.lat},${geoLocation.lng}&fulfilmentMethodType=$fulfilmentMethodType$distanceFromQueryParam',
    )
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
            listOfProductOptionCategories: [],
            priority: element['priority'] as int? ?? 0,
          ),
        );
      }
    }

    menuItems.sort((a, b) => a.priority.compareTo(b.priority));

    return menuItems;
  }

  Future<RestaurantMenuItem?> getRestaurantMenuItemByQrCode({
    required String restaurantID,
    required String barCode,
  }) async {
    Response<Map<String, dynamic>?> response;
    try {
      // final Response<Map<String, dynamic>?> response =
      response = await dioGet<Map<String, dynamic>>(
        'api/v1/products/get-product-by-qrcode',
        queryParameters: <String, dynamic>{
          'qrCode': barCode,
          'vendor': restaurantID
        },
      );
    } catch (e, s) {
      log.error(e);
      rethrow;
    }

    final element = response.data;
    if (element == null) {
      return null;
    }
    final pos = await getProductOptions(element['id'].toString());
    // List<ProductOptionsCategory> selectProductOptionsCategories =
    //     <ProductOptionsCategory>[];
    // for (final prodOptCat in pos) {
    //   for (final pov in prodOptCat.listOfOptions) {
    //     if (pov.productBarCode == barCode) {
    //       selectProductOptionsCategories = pos
    //           .where(
    //             (element) => element.name != prodOptCat.name,
    //           )
    //           .map(
    //             (element) => element.copyWith(
    //               listOfOptions: [element.listOfOptions[0]],
    //             ),
    //           )
    //           .toList()
    //         ..add(prodOptCat.copyWith(listOfOptions: [pov]));
    //       // selectProductOptionsCategories.add(
    //       //   prodOptCat.copyWith(
    //       //     listOfOptions: pos
    //       //         .where(
    //       //           (element) => element.name != prodOptCat.name,
    //       //         )
    //       //         .map((element) =>
    //       //             element.copyWith(listOfOptions: element.listOfOptions[0]))
    //       //         .toList()
    //       //       ..add(pov),
    //       //   ),
    //       // );
    //     }
    //   }
    // }
    return RestaurantMenuItem(
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
      listOfProductOptionCategories: pos,
      // listOfProductOptionCategories: selectProductOptionsCategories,
      priority: element['priority'] as int? ?? 0,
    );
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
            listOfProductOptionCategories: [],
            priority: element['priority'] as int? ?? 0,
          ),
        );
      }
    }

    menuItems.sort((a, b) => a.priority.compareTo(b.priority));

    return menuItems;
  }

  /// vegiRelUri is the relative uri in the orders sub directory (i.e. currently just the id of the order)
  Future<CreateOrderForFulfilment?> getOrderFromUri({
    required String vegiRelUri,
  }) async {
    final response =
        await dioGet<Map<String, dynamic>>('api/v1/orders/$vegiRelUri');

    if (response != null &&
        response.data != null &&
        response.data is Map<String, dynamic>) {
      return CreateOrderForDelivery.fromJson(response.data!);
    } else {
      return null;
    }
  }

  Future<List<ProductCategory>> getProductCategoriesForVendor(
    int vendorId,
  ) async {
    final Response<dynamic> response =
        await dio.get('api/v1/vendors/product-categories?vendor=$vendorId');

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

    final List<ProductOptionsCategory> listOfProductOptionCategories = [];

    for (final Map<String, dynamic> category in results) {
      final List<ProductOptions> listOfOptions = [];

      final List<Map<String, dynamic>> options =
          List.from(category['values'] as Iterable<dynamic>);

      for (final Map<String, dynamic> option in options) {
        listOfOptions.add(ProductOptions.fromJson(option));
      }

      if (options.isEmpty) continue;

      listOfProductOptionCategories.add(
        ProductOptionsCategory(
          categoryID: category['id'] as int? ?? 0,
          name: category['name'] as String? ?? '',
          listOfOptions: listOfOptions,
        ),
      );
    }

    return listOfProductOptionCategories;
  }

  Future<UploadProductSuggestionImageResponse?>
      uploadImageForProductSuggestion({
    required String deviceSuggestionUID,
    required File image,
    required void Function(UploadProductSuggestionImageResponse) onSuccess,
    required void Function(String error, ProductSuggestionUploadErrCode errCode)
        onError,
    required ProgressCallback onReceiveProgress,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await dioPostFile(
        'api/v1/products/upload-product-suggestion-image',
        file: image,
        formDataCreator: ({required MultipartFile file}) => FormData.fromMap({
          'uid': const Uuid().v4(),
          'image': file,
        }),
        errorResponseData: {'image': ''},
        onError: (error, errCode) {
          switch (errCode) {
            case FileUploadErrCode.imageTooLarge:
              return onError(
                error,
                ProductSuggestionUploadErrCode.imageTooLarge,
              );
            case FileUploadErrCode.imageEncodingError:
              return onError(
                error,
                ProductSuggestionUploadErrCode.imageEncodingError,
              );
            case FileUploadErrCode.unknownError:
              return onError(
                error,
                ProductSuggestionUploadErrCode.unknownError,
              );
          }
        },
        // options: Options? ,
        // cancelToken: CancelToken?,
        // onSendProgress: ProgressCallback?,
        onReceiveProgress: (count, total) =>
            onReceiveProgress != null ? onReceiveProgress(count, total) : null,
      );

      if (response.statusCode != null && response.statusCode! >= 400) {
        var errCode = ProductSuggestionUploadErrCode.unknownError;
        if (response.statusCode == 404) {
          errCode = ProductSuggestionUploadErrCode.productNotFound;
        } else if (response.statusCode == 500) {
          errCode = ProductSuggestionUploadErrCode.connectionIssue;
        }
        onError(
          response.statusMessage ?? 'Unknown Error',
          errCode,
        );
        return null;
      } else {
        final answer = UploadProductSuggestionImageResponse.fromJson(
          response.data as Map<String, dynamic>,
        );

        onSuccess(answer);

        return answer;
      }
    } catch (err, st) {
      log.error(err, stackTrace: st);
    }
  }

  Future<UploadProductSuggestionImageResponse?> tryUploadImage({
    required File image,
    required void Function(UploadProductSuggestionImageResponse) onSuccess,
    required void Function(String error, ProductSuggestionUploadErrCode errCode)
        onError,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await dioPostFile(
        'api/v1/products/upload-product-suggestion-image',
        file: image,
        formDataCreator: ({required MultipartFile file}) => FormData.fromMap({
          'uid': const Uuid().v4(),
          'image': file,
        }),
        errorResponseData: {'image': ''},
        onError: (error, errCode) {
          switch (errCode) {
            case FileUploadErrCode.imageTooLarge:
              return onError(
                error,
                ProductSuggestionUploadErrCode.imageTooLarge,
              );
            case FileUploadErrCode.imageEncodingError:
              return onError(
                error,
                ProductSuggestionUploadErrCode.imageEncodingError,
              );
            case FileUploadErrCode.unknownError:
              return onError(
                error,
                ProductSuggestionUploadErrCode.unknownError,
              );
          }
        },
        // options: Options? ,
        // cancelToken: CancelToken?,
        // onSendProgress: ProgressCallback?,
        onReceiveProgress: (count, total) =>
            onReceiveProgress != null ? onReceiveProgress(count, total) : null,
      );

      if (response.statusCode != null && response.statusCode! >= 400) {
        var errCode = ProductSuggestionUploadErrCode.unknownError;
        if (response.statusCode == 404) {
          errCode = ProductSuggestionUploadErrCode.productNotFound;
        } else if (response.statusCode == 500) {
          errCode = ProductSuggestionUploadErrCode.connectionIssue;
        }
        onError(
          response.statusMessage ?? 'Unknown Error',
          errCode,
        );
        return null;
      } else {
        final answer = UploadProductSuggestionImageResponse.fromJson(
          response.data as Map<String, dynamic>,
        );

        onSuccess(answer);

        return answer;
      }
    } catch (err, st) {
      log.error(err, stackTrace: st);
    }
  }

  Future<void> uploadProductSuggestion(
    ProductSuggestion suggestion,
    void Function() onSuccess,
    void Function(String error, ProductSuggestionUploadErrCode errCode) onError,
  ) async {
    final Response<dynamic> response = await dio
        .post(
      'api/v1/products/upload-product-suggestion',
      data: suggestion.toJsonUpload(),
    )
        .onError((error, stackTrace) {
      log.error(error, stackTrace: stackTrace);
      if (error is Map<String, dynamic> && error.containsKey('response')) {
        if (error['response'] is Response) {
          Response resp = (error as Map<String, Response>)['response']!;
          final wm = resp.toString();
          return resp;
        } else {
          log.error((error as Map<String, Response>)['response']!.toString());
        }
      } else if (error is DioError) {
        log.error((error as Map<String, Response>)['response']!.toString());
      }
      return Response(
        data: {},
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      );
    });

    if (response.statusCode != null && response.statusCode! >= 400) {
      var errCode = ProductSuggestionUploadErrCode.unknownError;
      if (response.statusCode == 404) {
        errCode = ProductSuggestionUploadErrCode.productNotFound;
      } else if (response.statusCode == 400) {
        errCode = ProductSuggestionUploadErrCode.wrongVendor;
      } else if (response.statusCode == 500) {
        errCode = ProductSuggestionUploadErrCode.connectionIssue;
      }
      onError(
        response.statusMessage ?? 'Unknown Error',
        errCode,
      );
    } else {
      onSuccess();
    }

    return;
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

  Future<void> getUserForWalletAddress(
    String walletAddress,
    void Function(bool userIsVerified) onSuccess,
    void Function(String error) onError,
  ) async {
    final Response<dynamic> response = await dioGet(
      '/api/v1/admin/user-for-wallet-address',
      queryParameters: {
        'walletAddress': walletAddress,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
    } else {
      onSuccess((response.data as Map<String, dynamic>)['verified'] as bool);
    }
  }

  Future<void> getAccountIsVendor(
    String walletAddress,
    void Function(bool isVendor, int? vendorId) onSuccess,
    void Function(String error) onError,
  ) async {
    if (walletAddress.isEmpty ||
        !RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(walletAddress)) {
      return onError(
        'Invalid Wallet Address passed to check if vendor. "$walletAddress"',
      );
    }
    final Response<dynamic> response = await dioGet(
      '/api/v1/admin/account-is-vendor',
      queryParameters: {
        'walletAddress': walletAddress,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
    } else {
      final data = response.data as Map<String, dynamic>;
      onSuccess(data['isVendor'] as bool, data['vendorId'] as int?);
    }
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

  Future<List<SurveyQuestion>> getSurveyQuestions() async {
    final Response<dynamic> response = await dio.get(
      '/api/v1/admin/get-survey-questions',
    );

    return (response.data as List<dynamic>)
        .map(
          (question) => SurveyQuestion.fromJson(
            question as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<Map<String, dynamic>> createOrder<T extends CreateOrderForFulfilment>(
    T orderObject,
  ) async {
    final Response<dynamic> response = await dio
        .post('/api/v1/orders/create-order', data: orderObject.toUploadJson());

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    return result;
  }

  String getOrderUri(String orderID) =>
      '$baseUrl/api/v1/orders/get-order-details?orderId=$orderID';

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
      final scheduledOrders =
          (response.data['scheduledOrders'] as List<dynamic>)
              .map((order) => Order.fromJson(order as Map<String, dynamic>))
              .toList();
      final ongoingOrders = (response.data['ongoingOrders'] as List<dynamic>)
          .map((order) => Order.fromJson(order as Map<String, dynamic>))
          .toList();
      return [
        ...ongoingOrders,
        ...scheduledOrders,
      ];
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
