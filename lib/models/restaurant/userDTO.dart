import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'userDTO.freezed.dart';
part 'userDTO.g.dart';

List<UserDTO> fromJsonUserDTOList(dynamic json) =>
    fromSailsListOfObjectJson<UserDTO>(UserDTO.fromJson)(json);
UserDTO? fromJsonUserDTO(dynamic json) =>
    fromSailsObjectJson<UserDTO>(UserDTO.fromJson)(json);

@Freezed()
class UserDTO with _$UserDTO {
  @JsonSerializable()
  factory UserDTO({
    required int id,
    required String? email,
    required String phoneNoCountry,
    required int phoneCountryCode,
    required bool marketingEmailContactAllowed,
    required bool marketingPhoneContactAllowed,
    required bool marketingPushContactAllowed,
    required int marketingNotificationUtility,
    required String name,
    required bool isSuperAdmin,
    required VegiRole role,
    required String vendorRole,
    required String deliveryPartnerRole,
    @JsonKey(fromJson: fromJsonVendorDTO) required VendorDTO? vendor,
    @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
        required DeliveryPartnerDTO? deliveryPartner,
  }) = _UserDTO;

  const UserDTO._();

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$UserDTOFromJson(json));
}
