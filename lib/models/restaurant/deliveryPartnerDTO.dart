import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'deliveryPartnerDTO.freezed.dart';
part 'deliveryPartnerDTO.g.dart';

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
