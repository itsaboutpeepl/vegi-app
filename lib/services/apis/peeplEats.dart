import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/admin/surveyQuestion.dart';
import 'package:vegan_liverpool/models/admin/uploadProductSuggestionImageResponse.dart';
import 'package:vegan_liverpool/models/admin/postVegiResponse.dart';
import 'package:vegan_liverpool/models/admin/vegiAccount.dart';
import 'package:vegan_liverpool/models/admin/vegiSession.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForDelivery.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/cart/createOrderResponse.dart';
import 'package:vegan_liverpool/models/cart/discount.dart';
import 'package:vegan_liverpool/models/cart/getOrdersResponse.dart';
import 'package:vegan_liverpool/models/cart/order.dart' as OrderModel;
import 'package:vegan_liverpool/models/cart/orderStatus.dart';
import 'package:vegan_liverpool/models/cart/productSuggestion.dart';
import 'package:vegan_liverpool/models/payments/transaction_item.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/productCategory.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/productRating.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/models/restaurant/userDTO.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';
import 'package:vegan_liverpool/models/waitingListFunnel/waitingListEntry.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/services/abstract_apis/httpService.dart';
import 'package:vegan_liverpool/services/apis/places.dart';
import 'package:vegan_liverpool/services/apis/vegiBackendEndpoints.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:redux/redux.dart';

@lazySingleton
class PeeplEatsService extends HttpService {
  PeeplEatsService(Dio dio) : super(dio, Secrets.VEGI_EATS_BACKEND) {
    dio.options.baseUrl = Secrets.VEGI_EATS_BACKEND;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  RestaurantItem _vendorJsonToRestaurantItem(Map<String, dynamic> element) {
    try {
      final List<Map<String, dynamic>> postalCodes = List.from(
        element['fulfilmentPostalDistricts'] as Iterable<dynamic>,
      );

      final List<String> deliversTo = [];

      for (final element in postalCodes) {
        deliversTo.add((element['outcode'] as String? ?? '').toUpperCase());
      }

      final vendor = VendorDTO.fromJson(element);

      return vendor.toRestaurantItem();

      // return RestaurantItem(
      //   restaurantID: element['id'].toString(),
      //   name: element['name'] as String? ?? '',
      //   description: element['description'] as String? ?? '',
      //   phoneNumber: element['phoneNumber'] as String? ?? '',
      //   status: element['status'] as String? ?? 'draft',
      //   deliveryRestrictionDetails: deliversTo,
      //   imageURL: element['imageUrl'] as String? ?? '',
      //   category: 'Category',
      //   costLevel: element['costLevel'] as int? ?? 2,
      //   rating: element['rating'] as int? ?? 2,
      //   address: DeliveryAddresses.fromJson(
      //     element['pickupAddress'] as Map<String, dynamic>,
      //   ),
      //   deliveryPartner: element.containsKey('deliveryPartner')
      //       ? DeliveryPartnerDTO.fromJson(
      //           element['deliveryPartner'] as Map<String, dynamic>,
      //         )
      //       : null,
      //   walletAddress: element['walletAddress'] as String? ?? '',
      //   listOfMenuItems: [],
      //   productCategories: [],
      //   isVegan: element['isVegan'] as bool? ?? false,
      //   minimumOrderAmount: element['minimumOrderAmount'] as int? ?? 0,
      //   platformFee: element['platformFee'] as int? ?? 0,
      // );
    } on Exception catch (e) {
      log.error(e);
      rethrow;
    }
  }

  // User Details

  bool get hasCookieStored => dio.options.headers.containsKey('Cookie');

  Future<bool> checkVegiSessionIsStillValid({
    void Function()? sessionIsStaleCallback,
  }) async {
    if (!hasCookieStored) {
      final cookie = (await reduxStore).state.userState.vegiSessionCookie;
      if (cookie == null || cookie.isEmpty) {
        sessionIsStaleCallback?.call();
        return false;
      }
      await setSessionCookie(cookie);
    }
    try {
      final Response<dynamic> response = await dioGet(
        VegiBackendEndpoints.isLoggedIn,
        sendWithAuthCreds: true,
      );

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw Exception(
          'Bad response returned when trying to checkVegiSessionIsStillValid: $response',
        );
      }

      final validSession = response.data!['authenticated'] as bool;

      if (!validSession) {
        sessionIsStaleCallback?.call();
      }

      return validSession;
    } on DioError catch (dioErr, s) {
      final onRealDevice = await DebugHelpers.deviceIsNotSimulator();
      if ((dioErr.message?.contains('Connection refused') ?? false) &&
          onRealDevice) {
        log.warn(
            'Unable to reverse proxy from physical device back to localhost vegi server.');
      } else {
        log.error(dioErr, stackTrace: s);
      }
      return false;
    } catch (e, s) {
      log.error(e, stackTrace: s);
      return false;
    }
  }

  Future<VegiSession> loginWithPhone({
    required String phoneNumber,
    required String firebaseSessionToken,
    bool rememberMe = true,
  }) async {
    if (hasCookieStored) {
      //todo: Dont login again if have user details already and isCookieExpired is false...
      // if(await isCookieExpired()){

      // }
      await deleteSessionCookie();
    }
    final Response<dynamic> response = await dioPost(
      VegiBackendEndpoints.loginWithPhone,
      sendWithAuthCreds: false,
      data: {
        'phoneNumber': phoneNumber,
        'firebaseSessionToken': firebaseSessionToken,
        'rememberMe': rememberMe
      },
    );

    // Capture session cookie to send with requests from nowon in a VegiSession object that we save to the singleton instance of the peeplEats service?...
    if (response.statusCode != null && response.statusCode! >= 400) {
      throw Exception(
        'Bad response returned when trying to loginWithPhone: $response',
      );
    } else if (response.headers.value('set-cookie') == null) {
      log.error(
        'No set-cookie returned in response headers when trying to loginWithPhone with:\n\t responseHeaders: ${response.headers} & response: $response',
      );
    }

    final userDetails =
        UserDTO.fromJson(response.data['user'] as Map<String, dynamic>);

    final cookie = response.headers.value('set-cookie');
    if (cookie != null) {
      await setSessionCookie(cookie);
      (await reduxStore)
        ..dispatch(
          SetVegiSessionCookie(
            cookie: cookie,
          ),
        )
        ..dispatch(
          SetUserAuthenticationStatus(
            vegiStatus: VegiAuthenticationStatus.authenticated,
          ),
        )
        ..dispatch(
          SetUserRoleOnVegi(
            userRole: userDetails.role,
            isSuperAdmin: userDetails.isSuperAdmin,
          ),
        );
    }
    return VegiSession(
      sessionCookie: cookie ?? '',
      user: userDetails,
    );
  }

  Future<VegiSession> loginWithEmail({
    required String emailAddress,
    required String firebaseSessionToken,
    bool rememberMe = true,
  }) async {
    if (hasCookieStored) {
      //todo: Dont login again if have user details already and isCookieExpired is false...
      // if(await isCookieExpired()){

      // }
      await deleteSessionCookie();
    }
    final Response<dynamic> response = await dioPost(
      VegiBackendEndpoints.loginWithEmail,
      sendWithAuthCreds: false,
      data: {
        'emailAddress': emailAddress,
        'firebaseSessionToken': firebaseSessionToken,
        'rememberMe': rememberMe
      },
    );

    // Capture session cookie to send with requests from nowon in a VegiSession object that we save to the singleton instance of the peeplEats service?...
    if (response.statusCode != null && response.statusCode! >= 400) {
      throw Exception(
        'Bad response returned when trying to loginWithEmail: $response',
      );
    } else if (response.headers.value('set-cookie') == null) {
      throw Exception(
        'No set-cookie returned in response headers when trying to loginWithPhone: $response',
      );
    }

    final userDetails =
        UserDTO.fromJson(response.data['user'] as Map<String, dynamic>);

    final cookie = response.headers.value('set-cookie');
    if (cookie != null) {
      await setSessionCookie(cookie);
      (await reduxStore)
        ..dispatch(
          SetVegiSessionCookie(
            cookie: cookie,
          ),
        )
        ..dispatch(
          SetUserAuthenticationStatus(
            vegiStatus: VegiAuthenticationStatus.authenticated,
          ),
        )
        ..dispatch(
          SetUserRoleOnVegi(
            userRole: userDetails.role,
            isSuperAdmin: userDetails.isSuperAdmin,
          ),
        );
    }
    return VegiSession(
      sessionCookie: cookie ?? '',
      user: userDetails,
    );
  }

  Future<void> logOut() async {
    await dioGet<dynamic>(
      VegiBackendEndpoints.logout,
    );
    await logoutSession();
  }

  // TODO: Implement - backend needs new deregister handle to deregister a user by email or phone and
  // todocont remove all wallet address backups, firebase creds, userlines from vegi and delete the user from firebase.
  // Future<bool> deregister({required String phoneNumber}) async {}

  // Future<bool> resetPassword({
  //   required String email,
  // }) async {}

  Future<List<RestaurantItem>> featuredRestaurants(
    String outCode, {
    bool dontRoute = false,
  }) async {
    final Response<dynamic> response = await dioGet<dynamic>(
      VegiBackendEndpoints.featuredRestaurants(outCode),
      sendWithAuthCreds: true,
      dontRoute: dontRoute,
    ).timeout(
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
          'If running from real_device, cant connect to localhost on running machine...',
        );
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
      VegiBackendEndpoints.fetchSingleRestaurant(restaurantID),
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

  Future<VendorDTO?> _fetchSingleRestaurantAsVendorDTO({
    required int vendorId,
  }) async {
    final Response<dynamic> response = await dioGet<dynamic>(
      VegiBackendEndpoints.fetchSingleRestaurant(vendorId),
    ).onError((error, stackTrace) {
      log.error(
        error,
        stackTrace: stackTrace,
      );
      return Response(
        data: {'vendor': null},
        requestOptions: RequestOptions(path: ''),
      );
    });

    final element = response.data['vendor'] as Map<String, dynamic>?;

    if (element != null) {
      return VendorDTO.fromJson(element);
    } else {
      return null;
    }
  }

  Future<List<RestaurantItem>> getRestaurantsByLocation({
    required Coordinates geoLocation,
    required num? distanceFromLocationAllowedInKm,
    required FulfilmentMethodType fulfilmentMethodTypeName,
    bool dontRoute = false,
  }) async {
    final distanceFromQueryParam = distanceFromLocationAllowedInKm == null
        ? ''
        : '&distance=$distanceFromLocationAllowedInKm';
    final fulfilmentMethodType =
        fulfilmentMethodTypeName != FulfilmentMethodType.none
            ? fulfilmentMethodTypeName.name
            : FulfilmentMethodType.collection.name;
    final Response<dynamic> response = await dioGet<dynamic>(
      VegiBackendEndpoints.fetchNearestRestaurants(
        geoLocation,
        distanceFromQueryParam,
        fulfilmentMethodType,
      ),
      dontRoute: dontRoute,
    ).timeout(
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
            // address: DeliveryAddresses.fromVendorJson(element),
            address: DeliveryAddresses.fromJson(
              element['pickupAddress'] as Map<String, dynamic>,
            ),
            deliveryPartner: element.containsKey('deliveryPartner')
                ? DeliveryPartnerDTO.fromJson(
                    element['deliveryPartner'] as Map<String, dynamic>,
                  )
                : null,
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
      'api/v1/vendors?outcode=$outCode&search=$globalSearchQuery',
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
            // address: DeliveryAddresses.fromVendorJson(element),
            address: DeliveryAddresses.fromJson(
              element['pickupAddress'] as Map<String, dynamic>,
            ),
            deliveryPartner: element.containsKey('deliveryPartner')
                ? DeliveryPartnerDTO.fromJson(
                    element['deliveryPartner'] as Map<String, dynamic>,
                  )
                : null,
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
    String restaurantID, {
    bool dontRoute = false,
  }) async {
    final Response<dynamic> response = await dioGet(
      'api/v1/vendors/$restaurantID',
      dontRoute: dontRoute,
    ); // BUG Taking too long

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
            isAvailable: element['isAvailable'] as bool? ?? false,
            vendorInternalId: element['vendorInternalId'] as String? ?? '',
            ingredients: element['ingredients'] as String? ?? '',
            productBarCode: element['productBarCode'] as String? ?? '',
            status: EnumHelpers.enumFromString(
                  ProductDiscontinuedStatus.values,
                  element['status'] as String,
                ) ??
                ProductDiscontinuedStatus.inactive,
            stockCount: element['stockCount'] as int? ?? 0,
            sizeInnerUnitValue: element['sizeInnerUnitValue'] as num? ?? 1,
            sizeInnerUnitType: element['sizeInnerUnitType'] as String? ?? 'g',
            stockUnitsPerProduct: element['stockUnitsPerProduct'] as num? ?? 1,
            brandName: element['brandName'] as String? ?? '',
            supplier: element['supplier'] as String? ?? '',
            taxGroup: element['taxGroup'] as String? ?? '',
          ),
        );
      }
    }

    menuItems.sort((a, b) => a.priority.compareTo(b.priority));

    return menuItems;
  }

  // Future<RestaurantMenuItem?> getRestaurantMenuItemByQrCode({
  //   required String restaurantID,
  //   required String barCode,
  // }) async {
  //   Response<Map<String, dynamic>?> response;
  //   try {
  //     // final Response<Map<String, dynamic>?> response =
  //     response = await dioGet<Map<String, dynamic>>(
  //       'api/v1/products/get-product-by-qrcode',
  //       queryParameters: <String, dynamic>{
  //         'qrCode': barCode,
  //         'vendor': restaurantID
  //       },
  //     );
  //   } catch (e, s) {
  //     log.error(e);
  //     rethrow;
  //   }

  //   final element = response.data;
  //   if (element == null) {
  //     return null;
  //   }
  //   final pos = await getProductOptions(element['id'].toString());
  //   // List<ProductOptionsCategory> selectProductOptionsCategories =
  //   //     <ProductOptionsCategory>[];
  //   // for (final prodOptCat in pos) {
  //   //   for (final pov in prodOptCat.listOfOptions) {
  //   //     if (pov.productBarCode == barCode) {
  //   //       selectProductOptionsCategories = pos
  //   //           .where(
  //   //             (element) => element.name != prodOptCat.name,
  //   //           )
  //   //           .map(
  //   //             (element) => element.copyWith(
  //   //               listOfOptions: [element.listOfOptions[0]],
  //   //             ),
  //   //           )
  //   //           .toList()
  //   //         ..add(prodOptCat.copyWith(listOfOptions: [pov]));
  //   //       // selectProductOptionsCategories.add(
  //   //       //   prodOptCat.copyWith(
  //   //       //     listOfOptions: pos
  //   //       //         .where(
  //   //       //           (element) => element.name != prodOptCat.name,
  //   //       //         )
  //   //       //         .map((element) =>
  //   //       //             element.copyWith(listOfOptions: element.listOfOptions[0]))
  //   //       //         .toList()
  //   //       //       ..add(pov),
  //   //       //   ),
  //   //       // );
  //   //     }
  //   //   }
  //   // }
  //   return RestaurantMenuItem(
  //     isFeatured: element['isFeatured'] as bool? ?? false,
  //     menuItemID: element['id'].toString(),
  //     restaurantID: restaurantID,
  //     name: element['name'] as String? ?? '',
  //     imageURL: element['imageUrl'] as String? ?? '',
  //     categoryName: element['category']['name'] as String? ?? '',
  //     categoryId: element['category']['id'] as int? ?? 0,
  //     price: element['basePrice'] as int? ?? 0,
  //     description: element['description'] as String? ?? '',
  //     extras: {},
  //     listOfProductOptionCategories: pos,
  //     // listOfProductOptionCategories: selectProductOptionsCategories,
  //     priority: element['priority'] as int? ?? 0,
  //   );
  // }

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
            isAvailable: element['isAvailable'] as bool? ?? false,
            vendorInternalId: element['vendorInternalId'] as String? ?? '',
            ingredients: element['ingredients'] as String? ?? '',
            productBarCode: element['productBarCode'] as String? ?? '',
            status: EnumHelpers.enumFromString(
                  ProductDiscontinuedStatus.values,
                  element['status'] as String,
                ) ??
                ProductDiscontinuedStatus.inactive,
            stockCount: element['stockCount'] as int? ?? 0,
            sizeInnerUnitValue: element['sizeInnerUnitValue'] as num? ?? 1,
            sizeInnerUnitType: element['sizeInnerUnitType'] as String? ?? 'g',
            stockUnitsPerProduct: element['stockUnitsPerProduct'] as num? ?? 1,
            brandName: element['brandName'] as String? ?? '',
            supplier: element['supplier'] as String? ?? '',
            taxGroup: element['taxGroup'] as String? ?? '',
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
    int vendorId, {
    bool dontRoute = false,
  }) async {
    final Response<dynamic> response = await dioGet(
      'api/v1/vendors/product-categories?vendor=$vendorId',
      dontRoute: dontRoute,
    );

    final List<dynamic> productCategories =
        response.data['productCategories'] as List<dynamic>;

    return productCategories
        .map(
          (e) => ProductCategory.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<List<ProductOptionsCategory>> getProductOptions(
    String itemID, {
    bool dontRoute = false,
  }) async {
    final Response<dynamic> response = await dioGet(
      'api/v1/products/get-product-options/$itemID?',
      dontRoute: dontRoute,
    );

    final List<Map<String, dynamic>> results =
        List.from(response.data as Iterable<dynamic>);

    final List<ProductOptionsCategory> listOfProductOptionCategories = [];

    for (final Map<String, dynamic> category in results) {
      final List<ProductOptionValue> listOfOptions = [];

      final List<Map<String, dynamic>> options =
          List.from(category['values'] as Iterable<dynamic>);

      for (final Map<String, dynamic> option in options) {
        listOfOptions.add(ProductOptionValue.fromJson(option));
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

  Future<Map<String, ProductRating>> getProductRatings({
    required List<String> productBarcodes,
  }) async {
    final Response<dynamic> response = await dioGet(
      'api/v1/products/get-product-rating',
      queryParameters: {
        'productBarcodes': productBarcodes,
      },
    );

    final responseDataMap = response.data as Map<String, dynamic>;
    final ratingsByBarcode = Map.fromEntries(
      responseDataMap.entries.map(
        (e) => MapEntry(
          e.key,
          ProductRating.fromJson(
            e.value as Map<String, dynamic>,
          ),
        ),
      ),
    );

    return ratingsByBarcode;
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

  Future<String> setRandomAvatar({
    required int accountId,
    required void Function(String error) onError,
  }) async {
    try {
      final Response<dynamic> response = await dioPost(
        '/api/v1/users/set-random-avatar',
        data: {'accountId': accountId},
        sendWithAuthCreds: true,
      );

      final results = response.data as Map<String, dynamic>;

      return results['imageUrl'] as String? ?? '';
    } on Exception catch (e, s) {
      // TODO
      log.error(
        e,
        stackTrace: s,
      );
      onError(e.toString());
      return '';
    }
  }

  Future<String?> uploadImageForUserAvatar({
    required File image,
    required int accountId,
    required void Function(String error, ProductSuggestionUploadErrCode errCode)
        onError,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await dioPostFile(
        'api/v1/users/upload-user-avatar',
        file: image,
        sendWithAuthCreds: true,
        formDataCreator: ({required MultipartFile file}) => FormData.fromMap({
          // 'uid': const Uuid().v4(),
          'image': file,
          'accountId': accountId
        }),
        errorResponseData: {'imageUrl': ''},
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
            onReceiveProgress?.call(count, total),
      );

      // if (response.statusCode != null && response.statusCode! >= 400) {
      //   var errCode = ProductSuggestionUploadErrCode.unknownError;
      //   if (response.statusCode == 404) {
      //     errCode = ProductSuggestionUploadErrCode.productNotFound;
      //   } else if (response.statusCode == 500) {
      //     errCode = ProductSuggestionUploadErrCode.connectionIssue;
      //   }
      //   onError(
      //     response.statusMessage ?? 'Unknown Error',
      //     errCode,
      //   );
      //   return null;
      // } else {
      //   final results = response.data as Map<String, dynamic>;

      //   return results['imageUrl'] as String? ?? '';
      // }
      final results = response.data as Map<String, dynamic>;

      return results['imageUrl'] as String? ?? '';
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

  Future<Discount?> validateFixedDiscountCode({
    required String code,
    required String walletAddress,
    int? vendor,
  }) async {
    // final store = await reduxStore;
    final Response<dynamic> response = await dioPost(
      '/api/v1/admin/validate-discount-code',
      data: {
        'code': code,
        'isGlobalPercentageCode': false,
        'walletAddress': walletAddress,
        'vendor': vendor,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      log.error(
          'Unable to validate fixed discount code with response: ${response.statusMessage}');
      return null;
    }
    if (response.data == false) {
      log.error(
          'No discount codes found for vendor[$vendor] and wallet: "$walletAddress" with code: "$code"');
      return null;
    }
    final data = response.data as Map<String, dynamic>;
    final vendorKVP = data['vendor'];
    if (vendorKVP is int) {
      final vendorDetails = await _fetchSingleRestaurantAsVendorDTO(
        vendorId: vendorKVP,
      );
      data['vendor'] = vendorDetails?.toJson();
    }
    return Discount.fromJson(data);
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

  Future<VegiAccount?> getVegiAccountForWalletAddress(
    String walletAddress,
    void Function(String error) onError,
  ) async {
    final Response<dynamic> response = await dioGet(
      'api/v1/admin/user-for-wallet-address',
      queryParameters: {
        'walletAddress': walletAddress,
      },
      sendWithAuthCreds: true,
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
      return null;
    } else {
      final result = VegiAccount.fromJson(
        response.data['account'] as Map<String, dynamic>,
      );
      return result;
    }
  }

  Future<UserDTO?> getUserDetails(
    String email,
    String phoneNoCountry,
    void Function(String error) onError,
  ) async {
    try {
      final Response<dynamic> response = await dioGet(
        '/api/v1/admin/user-details',
        queryParameters: {
          'email': email,
          'phoneNoCountry': phoneNoCountry,
        },
        sendWithAuthCreds: true,
        allowStatusCodes: [404],
      );
      if (response.statusCode != null && response.statusCode! >= 400) {
        if (response.statusCode! == 404) {
          log.info(
              'Expected 404 response for user details request for not internal vegi user');
          return null;
        }
        onError(response.statusMessage ?? 'Unknown Error');
        return null;
      } else {
        final result = UserDTO.fromJson(response.data as Map<String, dynamic>);
        return result;
      }
    } on Exception catch (e) {
      if (e is DioError) {
        if (e.response != null && e.response!.statusCode == 404) {
          return null;
        }
      }
      rethrow;
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
      'api/v1/admin/account-is-vendor',
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

  Future<WaitingListEntry?> updateEmailForAccount({
    required String email,
    required int waitingListEntryId,
    required void Function(String error) onError,
  }) async {
    final Response<dynamic> response = await dioPost(
      'api/v1/admin/update-waiting-list-entry',
      data: {
        'id': waitingListEntryId,
        'emailAddress': email,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
      return null;
    } else {
      final entry =
          WaitingListEntry.fromJson(response.data as Map<String, dynamic>);
      (await reduxStore)
          .dispatch(SetPositionInWaitingList(positionInQueue: entry.order));
      return entry;
    }
  }

  Future<WaitingListEntry?> registerEmailToWaitingList(
    String email,
    Store<AppState> store,
  ) async {
    final Response<dynamic> response = await dioPost(
      'api/v1/admin/register-email-to-waiting-list',
      data: {
        'emailAddress': email,
        'origin': kIsWeb ? 'guide' : 'mobile',
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      log.error(
        'Failed to registerEmailToWaitingList with response: ${response.statusMessage}',
        stackTrace: StackTrace.current,
      );
      return null;
    } else {
      final entry =
          WaitingListEntry.fromJson(response.data as Map<String, dynamic>);
      store.dispatch(SetPositionInWaitingList(positionInQueue: entry.order));
      return entry;
    }
  }

  Future<WaitingListEntry?> subscribeToWaitingListEmails({
    required String email,
    required bool receiveUpdates,
  }) async {
    final Response<dynamic> response = await dioPost(
      'api/v1/admin/subscribe-waitlist-email-notifications',
      data: {
        'emailAddress': email,
        'receiveUpdates': receiveUpdates,
        'firebaseRegistrationToken': await firebaseMessaging.getToken()
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      log.error(
        'Failed to subscribeToWaitingListEmails with response: ${response.statusMessage}',
        stackTrace: StackTrace.current,
      );
      return null;
    } else {
      return WaitingListEntry.fromJson(response.data as Map<String, dynamic>);
    }
  }

  Future<int> getPositionInWaitingList(
    String email,
    void Function(String error) onError,
  ) async {
    final Response<dynamic> response = await dioGet(
      '/api/v1/admin/get-position-in-waitinglist',
      queryParameters: {
        'emailAddress': email,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      onError(response.statusMessage ?? 'Unknown Error');
    }

    return response.data['position'] as int;
  }

  // Future<void> backupUserSK(
  //   String privateKey,
  // ) async {
  //   final Response<dynamic> response = await dioPost(
  //     'api/v1/admin/backup',
  //     data: {
  //       'privateKey': privateKey,
  //     },
  //     sendWithAuthCreds: true,
  //   );

  //   if (response.statusCode != null && response.statusCode! >= 400) {
  //     throw Exception(response.statusMessage ?? 'Unknown Error');
  //   }

  //   return;
  // }

  // Future<bool> isUserSKBackedUp({
  //   required String smartWalletAddress,
  // }) async {
  //   final Response<dynamic> response = await dioGet(
  //     'api/v1/admin/is-backed-up',
  //     queryParameters: {
  //       'smartWalletAddress': smartWalletAddress,
  //     },
  //     sendWithAuthCreds: true,
  //   );

  //   if (response.statusCode != null && response.statusCode! >= 400) {
  //     return false;
  //   } else if (response.data != null) {
  //     return response.data == true;
  //   }

  //   return false;
  // }

  Future<void> submitSurveyResponse(
    String email,
    String question,
    String answer,
    void Function() onSuccess,
    void Function(String error) onError,
  ) async {
    final Response<dynamic> response = await dio.post(
      'api/v1/admin/submit-survey-response',
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
      'api/v1/admin/get-survey-questions',
    );

    return (response.data as List<dynamic>)
        .map(
          (question) => SurveyQuestion.fromJson(
            question as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<CreateOrderResponse?> createOrder<T extends CreateOrderForFulfilment>(
    T orderObject,
  ) async {
    final response = await dioPost<Map<String, dynamic>>(
      'api/v1/orders/create-order',
      data: await orderObject.toUploadJson(),
    ).timeout(
      const Duration(seconds: inDebugMode ? 300 : 10),
      onTimeout: () {
        return Response(
          data: {},
          statusCode: 500,
          requestOptions: RequestOptions(path: 'api/v1/orders/create-order'),
        );
      },
    );
    if (response.data?.isEmpty ?? true) {
      return null;
    }
    final result = CreateOrderResponse.fromJson(response.data!);
    if (result.order.transactions.isEmpty) {
      result.order.transactions.add(
        TransactionItem(
          amount: orderObject.total,
          currency: Currency.GBPx,
          order: result.order.id,
          payer: -1,
          receiver: -2,
          timestamp: DateTime.now(),
        ),
      );
    }
    return result;
  }

  Future<bool?> cancelOrder({
    required int orderId,
    required int accountId,
    required String senderWalletAddress,
  }) async {
    final response = await dioPost<dynamic>(
      'api/v1/orders/cancel-order',
      data: {
        'orderId': orderId,
        'senderWalletAddress': senderWalletAddress,
      },
      sendWithAuthCreds: true,
    ).timeout(
      const Duration(seconds: inDebugMode ? 300 : 10),
      onTimeout: () {
        return Response(
          data: {},
          statusCode: 500,
          requestOptions: RequestOptions(path: 'api/v1/orders/cancel-order'),
        );
      },
    );
    if (response.statusCode != null && response.statusCode! >= 400) {
      return null;
    }
    final data = response.data as Map<String, dynamic>;
    // final result = CreateOrderResponse.fromJson(response.data!);
    // if (result.order.transactions.isEmpty) {
    //   result.order.transactions.add(
    //     TransactionItem(
    //       amount: orderObject.total,
    //       currency: Currency.GBPx,
    //       order: result.order.id,
    //       payer: -1,
    //       receiver: -2,
    //       timestamp: DateTime.now(),
    //     ),
    //   );
    // }
    final completedFlag = data['completedFlag'] as String;
    if (completedFlag != 'cancelled') {
      log.warn(
          'cancel-order request failed and returned an order with completedFlag: $completedFlag');
    }
    return completedFlag == 'cancelled';
  }

  String getOrderUri(String orderID) =>
      '$baseUrl/api/v1/orders/get-order-details?orderId=$orderID';

  Future<OrderStatus> checkOrderStatus(String orderID) async {
    final Response<dynamic> response =
        await dio.get('api/v1/orders/get-order-status?orderId=$orderID');

    final Map<String, dynamic> orderStatus =
        response.data as Map<String, dynamic>;

    return OrderStatus.fromJson(orderStatus);
  }

  Future<GetOrdersResponse> getOrdersForWallet(
    String walletAddress, {
    bool dontRoute = false,
  }) async {
    try {
      final Response<dynamic> response = await dioGet(
        'api/v1/orders?walletId=$walletAddress',
        dontRoute: dontRoute,
      );
      final scheduledOrders =
          (response.data['scheduledOrders'] as List<dynamic>)
              .map(
                (order) =>
                    OrderModel.Order.fromJson(order as Map<String, dynamic>),
              )
              .toList();
      final ongoingOrders = (response.data['ongoingOrders'] as List<dynamic>)
          .map(
            (order) => OrderModel.Order.fromJson(order as Map<String, dynamic>),
          )
          .toList();
      final pastOrders = (response.data['pastOrders'] as List<dynamic>)
          .map(
            (order) => OrderModel.Order.fromJson(order as Map<String, dynamic>),
          )
          .toList()
          .reversed
          .toList();
      final unpaidOrders = (response.data['unpaidOrders'] as List<dynamic>)
          .map(
            (order) => OrderModel.Order.fromJson(order as Map<String, dynamic>),
          )
          .toList()
          .reversed
          .toList();
      return GetOrdersResponse(
        ongoingOrders: ongoingOrders,
        scheduledOrders: scheduledOrders,
        pastOrders: pastOrders,
        unpaidOrders: unpaidOrders,
      );
    } catch (e, stackTrace) {
      log.error(
        'Order parsing threw with stackTrace: $stackTrace & error: $e',
      );
      throw Exception(e);
    }
  }

  Future<List<String>> getPostalCodes({
    bool dontRoute = false,
  }) async {
    final Response<dynamic> response = await dioGet(
      'api/v1/postal-districts/get-all-postal-districts',
      dontRoute: dontRoute,
    );

    final List<String> outCodes = [];

    final List<Map<String, dynamic>> data =
        List.from(response.data['postalDistricts'] as Iterable<dynamic>);

    for (final Map<String, dynamic> outcode in data) {
      outCodes.add((outcode['outcode'] as String? ?? '').toUpperCase());
    }

    return outCodes;
  }
}
