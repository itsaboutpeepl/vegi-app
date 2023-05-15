import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/userDTO.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'addressDTO.freezed.dart';
part 'addressDTO.g.dart';

List<AddressDTO> fromJsonAddressDTOList(dynamic json) =>
  fromSailsListOfObjectJson<AddressDTO>(AddressDTO.fromJson)(json);
AddressDTO? fromJsonAddressDTO(dynamic json) =>
  fromSailsObjectJson<AddressDTO>(AddressDTO.fromJson)(json);


@Freezed()
class AddressDTO with _$AddressDTO {
  @JsonSerializable()
  factory AddressDTO({
    required int id,
    required DeliveryAddressLabel label,
    required String addressLineOne,
    required String addressLineTwo,
    required String addressTownCity,
    required String addressPostCode,
    required String addressCountryCode,
    required double? latitude,
    required double? longitude,
    @JsonKey(fromJson: fromJsonVendorDTO) required VendorDTO? vendor,
    @JsonKey(fromJson: fromJsonDeliveryPartnerDTO) required DeliveryPartnerDTO? deliveryPartner,
    @JsonKey(fromJson: fromJsonUserDTO) required UserDTO? user,
  }) = _AddressDTO;

  const AddressDTO._();

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$AddressDTOFromJson(json));
}
