import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';

part 'deliveryAddresses.freezed.dart';
part 'deliveryAddresses.g.dart';

@Freezed()
class DeliveryAddresses with _$DeliveryAddresses {
  @JsonSerializable()
  factory DeliveryAddresses({
    required int internalID,
    required String addressLine1,
    required String addressLine2,
    required String townCity,
    required String postalCode,
    required DeliveryAddressLabel label,
  }) = _DeliveryAddresses;

  const DeliveryAddresses._();

  factory DeliveryAddresses.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressesFromJson(json);

  String get shortAddress =>
      '${addressLine1.capitalizeWords()}, ${postalCode.capitalizeWords()}'
          .maxChars(30);

  String get longAddress {
    if (addressLine2.isEmpty) {
      return '${addressLine1.capitalizeWords()}'
          ' \n${postalCode.capitalizeWords()},'
          ' ${townCity.capitalizeWords()}';
    }
    return '${addressLine2.capitalizeWords()}, '
        '${addressLine1.capitalizeWords()}'
        ' \n${postalCode.capitalizeWords()},'
        ' ${townCity.capitalizeWords()}';
  }

  bool deliversTo(List<String> fulfilmentPostalDistricts) {
    final RegExp regex = RegExp(
      r'^(((([A-Z][A-Z]{0,1})[0-9][A-Z0-9]{0,1}) {0,}[0-9])[A-Z]{2})$',
    );

    if (regex.hasMatch(postalCode)) {
      final match = regex.firstMatch(postalCode);
      if (match!.groupCount > 0) {
        return fulfilmentPostalDistricts.contains(match.group(3));
      }
    }
    return false;
  }
}
