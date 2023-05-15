import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'postalDistrict.freezed.dart';
part 'postalDistrict.g.dart';

List<PostalDistrict> fromJsonPostalDistrictList(dynamic json) =>
  fromSailsListOfObjectJson<PostalDistrict>(PostalDistrict.fromJson)(json);
PostalDistrict? fromJsonPostalDistrict(dynamic json) =>
  fromSailsObjectJson<PostalDistrict>(PostalDistrict.fromJson)(json);


@Freezed()
class PostalDistrict with _$PostalDistrict {
  @JsonSerializable()
  factory PostalDistrict({
    required int id,
    required String outcode,
    @Default([]) List<VendorDTO> vendors,
  }) = _PostalDistrict;

  const PostalDistrict._();

  factory PostalDistrict.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$PostalDistrictFromJson(json));
}
