import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/openingHours.dart';
import 'package:vegan_liverpool/models/restaurant/addressDTO.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'fulfilmentMethodDTO.freezed.dart';
part 'fulfilmentMethodDTO.g.dart';

List<FulfilmentMethodDTO> fromJsonFulfilmentMethodDTOList(dynamic json) =>
    fromSailsListOfObjectJson<FulfilmentMethodDTO>(
        FulfilmentMethodDTO.fromJson)(json);
FulfilmentMethodDTO? fromJsonFulfilmentMethodDTO(dynamic json) =>
    fromSailsObjectJson<FulfilmentMethodDTO>(FulfilmentMethodDTO.fromJson)(
        json);

@Freezed()
class FulfilmentMethodDTO with _$FulfilmentMethodDTO {
  @JsonSerializable()
  factory FulfilmentMethodDTO({
    required int id,
    required FulfilmentMethodType methodType,
    required num slotLength,
    num? bufferLength,
    String? orderCutoff,
    int? maxOrders,
    num? maxDeliveryDistance,
    num? priceModifier,
    @JsonKey(fromJson: fromJsonVendorDTO) required VendorDTO? vendor,
    @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
        required DeliveryPartnerDTO? deliveryPartner,
    @JsonKey(fromJson: fromJsonAddressDTO) AddressDTO? fulfilmentOrigin,
    @JsonKey(fromJson: fromJsonOpeningHours) OpeningHours? openingHours,
  }) = _FulfilmentMethodDTO;

  const FulfilmentMethodDTO._();

  factory FulfilmentMethodDTO.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$FulfilmentMethodDTOFromJson(json));
}
