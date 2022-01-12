import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/constants/urls.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

@lazySingleton
class VegiEatsService {
  final Dio dio;

  VegiEatsService(this.dio) {
    dio.options.baseUrl = UrlConstants.VEGI_EATS_BACKEND;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<List<RestaurantItem>> featuredRestaurants() async {
    Response response = await dio.get('vendors?wallet=test');

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
              address: element["pickupAddressPostCode"] +
                  ", " +
                  element["pickupAddressLineTwo"],
              listOfMenuItems: []),
        );
      },
    );

    return restaurants;
  }

  Future<List<MenuItem>> getRestaurantMenuItems(String restaurantID) async {
    Response response = await dio.get('vendors/$restaurantID?wallet=test');

    List<dynamic> results = response.data['vendor']['products'] as List;

    List<MenuItem> menuItems = [];

    results.forEach(
      (element) {
        menuItems.add(
          MenuItem(
              menuID: element["id"].toString(),
              name: element['name'],
              imageURLs: [
                UrlConstants.VEGI_EATS_BACKEND +
                    "products/download-image/" +
                    element['id'].toString()
              ],
              category: "Category",
              price: element['basePrice'] + 0.1,
              description: element['description'],
              options: demoOptions),
        );
      },
    );

    return menuItems;
  }
}
