import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/services/apis/places.dart';

class VegiBackendEndpoints {
  static const loginWithPhone = 'api/v1/admin/login-with-firebase';
  static const loginWithEmail = 'api/v1/admin/login-with-password';
  static const logout = 'api/v1/admin/logout';
  static const deregisterUser = 'api/v1/admin/deregister-user';
  static String featuredRestaurants(String outCode) =>
      'api/v1/vendors?outcode=$outCode';
  static String fetchSingleRestaurant(int restaurantID) =>
      'api/v1/vendors/$restaurantID';
  static String fetchNearestRestaurants(
    Coordinates geoLocation,
    String distanceFromQueryParam,
    String fulfilmentMethodType,
  ) =>
      'api/v1/home/nearest-vendors?location=${geoLocation.lat},${geoLocation.lng}&fulfilmentMethodType=$fulfilmentMethodType$distanceFromQueryParam';
}
