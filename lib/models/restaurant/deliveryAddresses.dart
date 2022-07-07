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

  factory DeliveryAddresses.fromJson(dynamic json) => _$DeliveryAddressesFromJson(json);
}
