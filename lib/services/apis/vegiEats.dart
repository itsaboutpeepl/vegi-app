import 'dart:math';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/constants/urls.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

@lazySingleton
class VegiEatsService {
  final Dio dio;

  VegiEatsService(this.dio) {
    dio.options.baseUrl = UrlConstants.VEGI_EATS_BACKEND;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<List<RestaurantItem>> featuredRestaurants() async {
    Response response = await dio.get('api/v1/vendors?wallet=test');

    List<dynamic> results = response.data['vendors'] as List;

    List<RestaurantItem> restaurants = [];

    results.forEach(
      (element) {
        restaurants.add(
          RestaurantItem(
            restaurantID: element["id"].toString(),
            name: element['name'],
            imageURL: UrlConstants.VEGI_EATS_BACKEND +
                "vendors/download-image/" +
                element['id'].toString(),
            category: "Category",
            costLevel: "Cost Level",
            deliveryTime: "Delivery Time",
            rating: "Rating",
            address: "Address",
            listOfMenuItems: [],
          ),
        );
      },
    );

    return restaurants;
  }

  Future<List<MenuItem>> getRestaurantMenuItems(String restaurantID) async {
    Response response =
        await dio.get('api/v1/vendors/$restaurantID?wallet=test');

    List<dynamic> results = response.data['vendor']['products'] as List;

    List<MenuItem> menuItems = [];

    results.forEach(
      (element) {
        menuItems.add(
          MenuItem(
            isFeatured: Random().nextBool(),
            menuID: element["id"].toString(),
            name: element['name'],
            imageURLs: [
              UrlConstants.VEGI_EATS_BACKEND +
                  "products/download-image/" +
                  element['id'].toString()
            ],
            category: "Category",
            price: element['basePrice'],
            description: element['description'],
            extras: {},
            listOfProductOptions: [],
          ),
        );
      },
    );

    return menuItems;
  }

  Future<List<ProductOptionsCategory>> getProductOptions(String itemID) async {
    Response response = await dio
        .get('api/v1/products/get-product-options/$itemID?wallet=test');

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
    Response response = await dio
        .get('api/v1/discounts/check-discount-code/$discountCode?wallet=test');

    Map<dynamic, dynamic> results = response.data['discount'] as Map;

    return results['percentage'];
  }

  Future<List<Map<String, String>>> getDeliverySlots() async {
    Response response = await dio
        .get('api/v1/vendors/get-fulfilment-slots?vendor=1&date=03-03-2022');

    List<dynamic> results = response.data['deliverySlots'] as List<dynamic>;

    List<Map<String, String>> listOfDeliverySlots = [];

    results.forEach((element) {
      listOfDeliverySlots.add(Map.from(element));
    });

    return listOfDeliverySlots;
  }

  Future<List<Map<String, String>>> getCollectionSlots() async {
    Response response = await dio
        .get('api/v1/vendors/get-fulfilment-slots?vendor=1&date=03-03-2022');

    List<dynamic> results = response.data['collectionSlots'] as List<dynamic>;

    List<Map<String, String>> listOfCollectionSlots = [];

    results.forEach((element) {
      listOfCollectionSlots.add(Map.from(element));
    });

    return listOfCollectionSlots;
  }

  Future<Map<dynamic, dynamic>> createOrder(
      Map<String, dynamic> orderObject) async {
    Response response = await dio
        .post('/api/v1/orders/create-order?wallet=test', data: orderObject);

    Map<dynamic, dynamic> result = response.data;

    return result;
  }

  Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID) async {
    Response response =
        await dio.get('/api/v1/orders/get-order-status?orderId=$orderID');

    Map<dynamic, dynamic> result = response.data;

    return result;
  }
}
