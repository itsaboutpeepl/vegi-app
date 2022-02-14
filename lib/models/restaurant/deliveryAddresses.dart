import 'package:freezed_annotation/freezed_annotation.dart';

part 'deliveryAddresses.freezed.dart';
part 'deliveryAddresses.g.dart';

@freezed
class DeliveryAddresses with _$DeliveryAddresses {
  const DeliveryAddresses._();

  @JsonSerializable()
  factory DeliveryAddresses({
    required String houseNumber,
    required String buildingName,
    required String streetName,
    required String postalCode,
    required double latitude,
    required double longitude,
  }) = _DeliveryAddresses;

  factory DeliveryAddresses.fromJson(dynamic json) =>
      _$DeliveryAddressesFromJson(json);
}
