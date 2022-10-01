import 'dart:math';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/admin/user.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/eligibleDeliveryCollectionDates.dart';
import 'package:vegan_liverpool/models/restaurant/fullfilmentMethods.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';
import 'package:vegan_liverpool/services/abstract_apis/iRestaurantsService.dart';

@lazySingleton
class PeeplEatsService extends IRestaraurantDeliveryService {
  

  PeeplEatsService(Dio dio) : super(dio) {
    this.dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<List<RestaurantItem>> featuredRestaurants(String outCode) async {
    Response response =
        await dioGet('/api/v1/vendors?outcode=$outCode').timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return Response(
          data: {"vendors": []},
          requestOptions: RequestOptions(path: ""),
        );
      },
    ).onError(
      (error, stackTrace) => Response(
        data: {"vendors": []},
        requestOptions: RequestOptions(path: ""),
      ),
    );

    List<dynamic> results = response.data['vendors'] as List;

    List<RestaurantItem> restaurantsActive = [];

    results.forEach(
      (element) {
        if (element['status'] == "active") {
          restaurantsActive.add(
            RestaurantItem(
                restaurantID: element["id"].toString(),
                name: element['name'] ?? "",
                description: element["description"] ?? "",
                phoneNumber: element['phoneNumber'] ?? "",
                status: element['status'] ?? "draft",
                deliveryRestrictionDetails: [], // TODO: Remove this entirely
                imageURL: element["imageUrl"],
                category: "Category",
                costLevel: element['costLevel'] ?? 2,
                rating: element['rating'] ?? 2,
                address: DeliveryAddresses.fromVendorJson(element['address']),
                walletAddress: element['walletAddress'],
                listOfMenuItems: [],
                isVegan: element['isVegan'] ?? false,
                minimumOrderAmount: element['minimumOrderAmount'],
                platformFee: element['platformFee']),
          );
        }
      },
    );

    restaurantsActive.removeWhere((element) => element.status == "draft");

    return restaurantsActive;
  }

  Future<List<RestaurantMenuItem>> getRestaurantMenuItems(
      String restaurantID) async {
    Response response = await dioGet('/api/v1/vendors/$restaurantID?');

    List<dynamic> results = response.data['vendor']['products'] as List;

    List<RestaurantMenuItem> menuItems = [];

    results.forEach(
      (element) {
        if (element["isAvailable"])
          menuItems.add(
            RestaurantMenuItem(
              isFeatured: element['isFeatured'] ?? Random().nextBool(),
              menuItemID: element["id"].toString(),
              restaurantID: restaurantID,
              name: element['name'],
              imageURL: element["imageUrl"] ?? "",
              category: "Category",
              price: element['basePrice'],
              description: element['description'],
              extras: {},
              listOfProductOptions: [],
              priority: element['priority'] ?? 0,
            ),
          );
      },
    );

    menuItems.sort((a, b) => a.priority.compareTo(b.priority));

    return menuItems;
  }

  Future<User?> signUp(
      {required String countryCode,
      required String phoneNoCountry,
      String? name,
      String? email}) async {
    final response = await dioPost('/api/v1/admin/', data: <String, String?>{
      'emailAddress': email,
      'phoneNoCountry': phoneNoCountry,
      'phoneCountryCode': countryCode,
      'name': name,
    });

    if (response.statusCode != null && response.statusCode! < 400) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<User?> signIn(
      {required String phoneNumber,
      required String firebaseSessionToken}) async {
    final response = await dioPost('/api/v1/admin/login-with-firebase',
        data: <String, String>{
          'phoneNumber': phoneNumber,
          'firebaseSessionToken': firebaseSessionToken
        });

    if (response.statusCode != null && response.statusCode! < 400) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<bool> signOut() async {
    final response = await dioGet('/api/v1/admin/logout');

    return response.statusCode != null && response.statusCode! < 400;
  }

  Future<bool> deregister({required User user}) async {
    final response =
        await dioPost('/api/v1/admin/deregister-user', data: <String, String>{
      'id': user.id,
    });

    return response.statusCode != null && response.statusCode! < 400;
  }

  Future<bool> userIsProductOwnerForRestaurant(
      String restaurantID, String sessionToken) async {
    final response = await dioGet(
        'api/v1/vendors/check-product-owner?token=${sessionToken}&restaurantID=$restaurantID');

    return response.data['is_owner'] ?? false;
  }

  Future<bool> createRestaurantMenuItem(RestaurantMenuItem newItem) async {
    final assertResponse = await userIsProductOwnerForRestaurant(
        newItem.restaurantID, 'abcd-1234-efgh-5678');

    if (!assertResponse) {
      return false;
    }

    final response =
        await dioPost('/api/v1/vendors/create-item', data: newItem.toJson());

    return response.statusCode == 200;
  }

  Future<List<ProductOptionsCategory>> getProductOptions(String itemID) async {
    Response response =
        await dioGet('/api/v1/products/get-product-options/$itemID?');

    List<dynamic> results = response.data as List;

    List<ProductOptionsCategory> listOfProductOptions = [];

    results.forEach(
      (category) {
        List<ProductOptions> listOfOptions = [];
        category['values'].forEach(
          (option) {
            listOfOptions.add(
              ProductOptions(
                optionID: option['id'],
                name: option['name'],
                description: option['description'],
                price: option['priceModifier'],
                isAvaliable: option['isAvailable'],
              ),
            );
          },
        );

        if (category["values"].isEmpty) return;

        listOfProductOptions.add(
          ProductOptionsCategory(
            categoryID: category['id'],
            name: category['name'],
            listOfOptions: listOfOptions,
          ),
        );
      },
    );

    return listOfProductOptions;
  }

  Future<int> checkDiscountCode(String discountCode) async {
    Response response =
        await dioGet('/api/v1/discounts/check-discount-code/$discountCode?');

    Map<dynamic, dynamic> results = response.data['discount'] as Map;

    return results['percentage'];
  }

  Future<FullfilmentMethods> getFulfilmentSlots(
      {required String vendorID, required String dateRequired}) async {
    Response response = await dioGet(
        'api/v1/vendors/get-fulfilment-slots?vendor=$vendorID&date=$dateRequired');

    FullfilmentMethods methods = FullfilmentMethods.fromJson(response.data);

    return methods;
  }

  Future<Map<dynamic, dynamic>> createOrder(
      Map<String, dynamic> orderObject) async {
    Response response =
        await dioPost('/api/v1/orders/create-order', data: orderObject);

    Map<dynamic, dynamic> result = response.data;

    return result;
  }

  Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID) async {
    Response response =
        await dioGet('/api/v1/orders/get-order-status?orderId=$orderID');

    Map<dynamic, dynamic> result = response.data;

    return result;
  }

  Future<List<Map<String, dynamic>>> getPastOrders(String walletAddress) async {
    Response response = await dioGet('/api/v1/orders?walletId=$walletAddress');
    return sanitizeOrdersList(response.data);
  }

  Future<List<String>> getPostalCodes() async {
    Response response =
        await dioGet('/api/v1/postal-districts/get-all-postal-districts');

    List<String> outCodes = [];

    response.data.forEach((element) {
      outCodes.add(element["outcode"].toUpperCase());
    });

    return outCodes;
  }

  @override
  Future<EligibleDeliveryCollectionDates> getEligibleOrderDates(
      {required String vendorID}) async {
    Response response = await dio
        .get('/api/v1/vendors/get-eligible-order-dates?vendor=$vendorID');

    EligibleDeliveryCollectionDates orderDates =
        EligibleDeliveryCollectionDates.fromJson(response.data);

    return orderDates;
  }
}