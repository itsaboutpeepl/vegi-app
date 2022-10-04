import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// String phoneFromJson(Map<String,dynamic> json){
//   final phoneCountryCode = json['phoneCountryCode'];
//   final phoneNoCountry = json['phoneNoCountry'];
//   return '+$phoneCountryCode$phoneNoCountry';
// }

// Map<String,dynamic> phoneToJson(User user){
//   final phoneNoCountry = user.phone.substring(user.phone.length - 10);
//   final phoneCountryCode = user.phone.substring(2, user.phone.length - phoneNoCountry.length);
// }

@Freezed()
class User with _$User {
  const User._();

  String get phone => '+$phoneCountryCode$phoneNoCountry';

  @JsonSerializable()
  factory User({
    required int id,
    // @JsonKey(fromJson: phoneFromJson, ) required String phone,
    required int phoneCountryCode,
    required int phoneNoCountry,
    @Default('') String email,
    @Default('') String name,
    @Default(false) bool isSuperAdmin,
    @Default('') String firebaseSessionToken,
    @Default('none') String role,
    @Default(null) num? vendor,
    @Default('none') String vendorRole,
    @Default(null) num? courier,
    @Default('none') String courierRole,
    @Default('') String cookie,
  }) = _User;

  factory User.fromJson(dynamic json) => _$UserFromJson(json);

  Map<String, dynamic> vendorToJson(RestaurantItem? Vendor) =>
      Vendor?.toJson() ?? {};
}
