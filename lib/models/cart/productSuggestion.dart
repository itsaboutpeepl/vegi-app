import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/admin/uploadProductSuggestionImageResponse.dart';

part 'productSuggestion.freezed.dart';
part 'productSuggestion.g.dart';

@Freezed()
class ProductSuggestion with _$ProductSuggestion {
  @JsonSerializable()
  factory ProductSuggestion({
    required String uid,
    required String name,
    required String store,
    required String qrCode,
    required String additionalInformation,
    required Map<ProductSuggestionImageType,
            UploadProductSuggestionImageResponse>
        images, // ! File is not a serializable type...
  }) = _ProductSuggestion;

  const ProductSuggestion._();

  factory ProductSuggestion.fromJson(Map<String, dynamic> json) =>
      _$ProductSuggestionFromJson(json);

  factory ProductSuggestion.newUid() => ProductSuggestion(
        uid: const Uuid().v4(),
        name: '',
        store: '',
        qrCode: '',
        additionalInformation: '',
        images: {},
      );

  //Section Getters
  List<Map<String, dynamic>> get imageUrls =>
      images.entries.map((e) => e.value.toJson()).toList();

  Map<String, dynamic> toJsonUpload() => {
        'name': name,
        'store': store,
        'qrCode': qrCode,
        'additionalInformation': additionalInformation,
        'imageUrls': imageUrls,
      };
}
