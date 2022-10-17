import 'package:freezed_annotation/freezed_annotation.dart';

part 'fullfilmentMethods.freezed.dart';
part 'fullfilmentMethods.g.dart';

@Freezed()
class FullfilmentMethods with _$FullfilmentMethods {
  @JsonSerializable()
  factory FullfilmentMethods({
    required Map<String, dynamic>? collectionMethod,
    required Map<String, dynamic>? deliveryMethod,
    required List<Map<String, String>> collectionSlots,
    required List<Map<String, String>> deliverySlots,
  }) = _FullfilmentMethods;

  const FullfilmentMethods._();

  factory FullfilmentMethods.fromJson(Map<String, dynamic> json) =>
      _$FullfilmentMethodsFromJson(json);
}
