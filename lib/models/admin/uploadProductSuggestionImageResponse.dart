import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploadProductSuggestionImageResponse.freezed.dart';
part 'uploadProductSuggestionImageResponse.g.dart';

@Freezed()
class UploadProductSuggestionImageResponse
    with _$UploadProductSuggestionImageResponse {
  @JsonSerializable()
  factory UploadProductSuggestionImageResponse({
    required String url,
    required String uid,
  }) = _UploadProductSuggestionImageResponse;

  const UploadProductSuggestionImageResponse._();

  factory UploadProductSuggestionImageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UploadProductSuggestionImageResponseFromJson(json);
}
