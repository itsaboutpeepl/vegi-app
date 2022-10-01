import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const User._();

  @JsonSerializable()
  factory User({
    required String id,
    required String phone,
    @Default('') String email,
    @Default('') String name,
    @Default(false) bool isSuperAdmin,
    @Default('') String firebaseSessionToken,
    @Default(null) num? vendor,
    @Default('') String vendorRole,
  }) = _User;

  factory User.fromJson(dynamic json) => _$UserFromJson(json);

  Map<String, dynamic> vendorToJson(RestaurantItem? Vendor) =>
      Vendor?.toJson() ?? {};
}
