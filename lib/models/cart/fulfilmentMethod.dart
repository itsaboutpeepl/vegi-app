import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/cart/openingHours.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'fulfilmentMethod.freezed.dart';
part 'fulfilmentMethod.g.dart';

@Freezed()
class FulfilmentMethod with _$FulfilmentMethod {
  @JsonSerializable()
  factory FulfilmentMethod({
    required int id,
    required FulfilmentMethodType methodType,
    required num? slotLength,
    required num? bufferLength,
    required String? orderCutoff,
    required int? maxOrders,
    @Default(null) int? maxDeliveryDistance,
    required num? priceModifier,
    @Default(null) VendorDTO? vendor,
    @Default(null) DeliveryPartnerDTO? deliveryPartner,
    @Default(null) OpeningHours? openingHours,
    @Default(null) DeliveryAddresses? fulfilmentOrigin,
  }) = _FulfilmentMethod;

  const FulfilmentMethod._();

  factory FulfilmentMethod.fromJson(Map<String, dynamic> json) =>
      _$FulfilmentMethodFromJson(json);
}
