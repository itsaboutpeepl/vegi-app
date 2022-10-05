import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'deliveryAddresses.freezed.dart';
part 'deliveryAddresses.g.dart';

@Freezed()
class DeliveryAddresses with _$DeliveryAddresses {
  const DeliveryAddresses._();

  @JsonSerializable()
  factory DeliveryAddresses({
    required int internalID,
    required String addressLine1,
    required String addressLine2,
    required String townCity,
    required String postalCode,
    required double latitude,
    required double longitude,
    String? phoneNumber,
    String? label,
  }) = _DeliveryAddresses;

  factory DeliveryAddresses.fromJson(dynamic json) =>
      _$DeliveryAddressesFromJson(json);

  factory DeliveryAddresses.fromVendorJson(Map<String, dynamic> json) {
    return DeliveryAddresses(
        internalID:
            Random((DateTime.now().millisecondsSinceEpoch)).nextInt(10000),
        addressLine1: json['pickupAddressLineOne'] ?? '',
        addressLine2: json['pickupAddressLineTwo'] ?? '',
        townCity: json['pickupAddressCity'] ?? '',
        postalCode: json['pickupAddressPostCode'] ?? '',
        latitude: json['pickupAddressLatitude'] ?? 0.0,
        longitude: json['pickupAddressLongitude'] ?? 0.0);
  }
}
