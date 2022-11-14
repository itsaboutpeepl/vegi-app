import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendorDTO.freezed.dart';
part 'vendorDTO.g.dart';

@Freezed()
class VendorDTO with _$VendorDTO {
  @JsonSerializable()
  factory VendorDTO({
    required int id,
    required String name,
    required String? phoneNumber,
  }) = _VendorDTO;

  const VendorDTO._();

  factory VendorDTO.fromJson(Map<String, dynamic> json) =>
      _$VendorDTOFromJson(json);
}
