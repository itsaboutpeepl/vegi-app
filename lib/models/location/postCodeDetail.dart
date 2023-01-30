import 'package:freezed_annotation/freezed_annotation.dart';

part 'postCodeDetail.freezed.dart';
part 'postCodeDetail.g.dart';

@Freezed()
class PostCodeDetail with _$PostCodeDetail {
  @JsonSerializable()
  factory PostCodeDetail({
    required String postcode,
    required int quality,
    required String outcode,
    required String incode,
    required double distance,
    required double latitude,
    required double longitude,
  }) = _PostCodeDetail;

  const PostCodeDetail._();

  factory PostCodeDetail.fromJson(Map<String, dynamic> json) =>
      _$PostCodeDetailFromJson(json);
}
