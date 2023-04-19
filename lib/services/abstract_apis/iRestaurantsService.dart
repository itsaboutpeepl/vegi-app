// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:dio/src/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:vegan_liverpool/models/admin/user.dart';
// import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
// import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
// import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
// import 'package:vegan_liverpool/services/abstract_apis/httpService.dart';

// const Object requiresAdmin = _RequiresAdmin();

// class _RequiresAdmin {
//   //*: Check that the method invoked is in a class where user has to be signed in to use the methods.
//   const _RequiresAdmin();
// }

// abstract class IRestaraurantManagementService {
//   // Restaurants
//   // outCode refers to postcode that restaurants deliver to: i.e. 'L1'
//   Future<List<RestaurantItem>> featuredRestaurants(String outCode);

//   Future<List<RestaurantItem>> activeRestaurants(String outCode);

//   @requiresAdmin
//   Future<List<RestaurantItem>> adminAllRestaurants(String outCode);

//   // Products
//   Future<List<RestaurantMenuItem>> getRestaurantMenuItems(String restaurantID);

//   Future<List<ProductOptionsCategory>> getProductOptions(String itemID);

//   Future<int> checkDiscountCode(String discountCode);

//   // Orders
//   Future<FullfilmentMethods> getFulfilmentSlots({
//     required String vendorID,
//     required String dateRequired,
//   });

//   Future<Map<dynamic, dynamic>> createOrder(Map<String, dynamic> orderObject);

//   Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID);

//   Future<List<Map<String, dynamic>>> getPastOrders(String walletAddress);

//   Future<List<String>> getPostalCodes();

//   // User Details
//   Future<User?> signUp(
//       {required String countryCode,
//       required String phoneNoCountry,
//       String? name,
//       String? email});

//   Future<User?> signIn(
//       {String phoneNumber, required String firebaseSessionToken});

//   Future<bool> signOut();

//   Future<bool> deregister({required String phoneNumber});
// }

// abstract class IRestaraurantDeliveryService extends HttpService {
//   IRestaraurantDeliveryService(Dio dio)
//       : super(dio, dotenv.env['VEGI_EATS_BACKEND']!);

//   // User Details
//   Future<User?> signUp(
//       {required String countryCode,
//       required String phoneNoCountry,
//       String? name,
//       String? email});

//   Future<User?> signIn(
//       {required String phoneNumber, required String firebaseSessionToken});

//   Future<bool> signOut();

//   Future<bool> deregister({required User user});

//   // Restaurants
//   // outCode refers to postcode that restaurants deliver to: i.e. 'L1'
//   Future<List<RestaurantItem>> featuredRestaurants(String outCode);

//   // Products
//   Future<List<RestaurantMenuItem>> getRestaurantMenuItems(String restaurantID);

//   Future<List<ProductOptionsCategory>> getProductOptions(String itemID);

//   Future<int> checkDiscountCode(String discountCode);

//   // Orders
//   Future<FullfilmentMethods> getFulfilmentSlots(
//       {required String vendorID, required String dateRequired});

//   Future<EligibleDeliveryCollectionDates> getEligibleOrderDates(
//       {required String vendorID});

//   Future<Map<dynamic, dynamic>> createOrder(Map<String, dynamic> orderObject);

//   Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID);

//   Future<List<Map<String, dynamic>>> getPastOrders(String walletAddress);

//   Future<List<String>> getPostalCodes();
// }
