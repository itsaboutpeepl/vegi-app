import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'deliveryPartnerDTO.freezed.dart';
part 'deliveryPartnerDTO.g.dart';

List<DeliveryPartnerDTO> fromJsonDeliveryPartnerDTOList(dynamic json) =>
  fromSailsListOfObjectJson<DeliveryPartnerDTO>(DeliveryPartnerDTO.fromJson)(json);
DeliveryPartnerDTO? fromJsonDeliveryPartnerDTO(dynamic json) =>
  fromSailsObjectJson<DeliveryPartnerDTO>(DeliveryPartnerDTO.fromJson)(json);


@Freezed()
class DeliveryPartnerDTO with _$DeliveryPartnerDTO {
  @JsonSerializable()
  factory DeliveryPartnerDTO({
    required int id,
    required String name,
  }) = _DeliveryPartnerDTO;

  const DeliveryPartnerDTO._();

  factory DeliveryPartnerDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPartnerDTOFromJson(json);
}
