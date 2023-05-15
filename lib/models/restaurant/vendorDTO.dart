import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/addressDTO.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryPartnerDTO.dart';
import 'package:vegan_liverpool/models/restaurant/fulfilmentMethodDTO.dart';
import 'package:vegan_liverpool/models/restaurant/postalDistrict.dart';
import 'package:vegan_liverpool/models/restaurant/productCategory.dart';
import 'package:vegan_liverpool/models/restaurant/productDTO.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/vendorCategory.dart';

part 'vendorDTO.freezed.dart';
part 'vendorDTO.g.dart';

List<VendorDTO> fromJsonVendorDTOList(dynamic json) =>
  fromSailsListOfObjectJson<VendorDTO>(VendorDTO.fromJson)(json);
VendorDTO? fromJsonVendorDTO(dynamic json) =>
  fromSailsObjectJson<VendorDTO>(VendorDTO.fromJson)(json);



@Freezed()
class VendorDTO with _$VendorDTO {
  @JsonSerializable()
  factory VendorDTO({
    required int id,
    required String name,
    required VendorType type,
    required String? phoneNumber,
    required num? costLevel,
    required num? rating,
    required bool isVegan,
    @Default(0) num minimumOrderAmount,
    @Default(0) num platformFee,
    required VendorStatus status,
    required String walletAddress,
    @Default('') String description,
    @Default('') String imageUrl,
    @JsonKey(fromJson: fromJsonAddressDTO)
    required AddressDTO? pickupAddress,
    @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
    DeliveryPartnerDTO? deliveryPartner,
    @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
    FulfilmentMethodDTO? deliveryFulfilmentMethod,
    @JsonKey(fromJson: fromJsonFulfilmentMethodDTO)
    FulfilmentMethodDTO? collectionFulfilmentMethod,
    @JsonKey(fromJson: fromJsonProductDTOList)
    @Default([]) List<ProductDTO> products,
    @JsonKey(fromJson: fromJsonVendorCategoryList)
    required List<VendorCategory> vendorCategories,
    @JsonKey(fromJson: fromJsonProductCategoryList)
    required List<ProductCategory> productCategories,
    @JsonKey(fromJson: fromJsonPostalDistrictList)
    @Default([]) List<PostalDistrict> fulfilmentPostalDistricts,
  }) = _VendorDTO;

  const VendorDTO._();

  String get restaurantID => id.toString();
  String get imageURL => imageUrl;
  DeliveryAddresses? get address => pickupAddress == null
      ? null
      : DeliveryAddresses(
          internalID: Random(
            DateTime.now().millisecondsSinceEpoch,
          ).nextInt(100000),
          addressLine1: pickupAddress!.addressLineOne,
          addressLine2: pickupAddress!.addressLineTwo,
          townCity: pickupAddress!.addressTownCity,
          postalCode: pickupAddress!.addressPostCode,
          label: pickupAddress!.label,
          latitude: pickupAddress!.latitude ?? 0.0,
          longitude: pickupAddress!.longitude ?? 0.0,
        );
  List<String> get deliveryRestrictionDetails => fulfilmentPostalDistricts
      .map(
        (e) => e.outcode,
      )
      .toList();
  List<RestaurantMenuItem> get listOfMenuItems => products
      .map(
        (product) => product.toRestaurantMenuItem(),
      )
      .toList();

  factory VendorDTO.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$VendorDTOFromJson(json));

  Money get minimumOrderAmountMoney => Money(
        currency: Currency.GBPx,
        value: minimumOrderAmount,
      );
  Money get platformFeeMoney => Money(
        currency: Currency.GBPx,
        value: platformFee,
      );

  RestaurantItem toRestaurantItem() => RestaurantItem(
        address: address!,
        category: 'Category',
        costLevel: costLevel?.round() ?? 0,
        deliveryPartner: deliveryPartner,
        deliveryRestrictionDetails: deliveryRestrictionDetails,
        description: description,
        imageURL: imageURL,
        isVegan: isVegan,
        listOfMenuItems: listOfMenuItems,
        minimumOrderAmount: minimumOrderAmount.round(),
        name: name,
        phoneNumber: phoneNumber ?? '',
        platformFee: platformFee.round(),
        productCategories: productCategories,
        rating: rating?.round() ?? 0,
        restaurantID: restaurantID,
        status: status.name,
        walletAddress: walletAddress,
      );
}
