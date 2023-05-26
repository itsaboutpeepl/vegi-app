import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/ESCRating.dart';
import 'package:vegan_liverpool/models/restaurant/productCategory.dart';
import 'package:vegan_liverpool/models/restaurant/productOption.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'productDTO.freezed.dart';
part 'productDTO.g.dart';

List<ProductDTO> fromJsonProductDTOList(dynamic json) =>
    fromSailsListOfObjectJson<ProductDTO>(ProductDTO.fromJson)(json);
ProductDTO? fromJsonProductDTO(dynamic json) =>
    fromSailsObjectJson<ProductDTO>(ProductDTO.fromJson)(json);

@Freezed()
class ProductDTO with _$ProductDTO {
  @JsonSerializable()
  factory ProductDTO({
    required int id,
    required String name,
    @Default('') String description,
    @Default('') String shortDescription,

    /// this is the price in pence of the restaurant item without any product options applied
    required int basePrice,
    @Default('') String imageURL,
    required bool isAvailable,
    required int priority,
    required bool isFeatured,
    required ProductDiscontinuedStatus status,
    String? ingredients,
    @Default('') String vendorInternalId,
    @Default(0) int stockCount,
    @Default(1) num stockUnitsPerProduct,
    @Default(1) num sizeInnerUnitValue,
    @Default('') String sizeInnerUnitType,
    required String productBarCode,
    @Default('') String supplier,
    @Default('') String brandName,
    @Default('') String taxGroup,
    @JsonKey(fromJson: fromJsonVendorDTO) required VendorDTO? vendor,
    @JsonKey(fromJson: fromJsonProductCategory)
        required ProductCategory? category,
    @JsonKey(fromJson: fromJsonProductOptionList)
    @Default([])
        List<ProductOption> options,
    @JsonKey(fromJson: fromJsonESCRating) @Default(null) ESCRating? rating,
  }) = _ProductDTO;

  const ProductDTO._();

  String get menuItemID => id.toString();
  String get restaurantID => vendor?.id.toString() ?? '';
  String get categoryName => category?.name ?? '';
  int get categoryId => category?.id ?? 0;

  Map<String, int> get extras => <String, int>{};
  List<ProductOptionsCategory> get listOfProductOptionCategories => options
      .map(
        (option) => ProductOptionsCategory(
          categoryID: option.id,
          name: option.name,
          listOfOptions: option.values,
        ),
      )
      .toList();

  Money get price => Money(
        currency: Currency.GBPx,
        value: basePrice,
      );

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$ProductDTOFromJson(json));

  RestaurantMenuItem toRestaurantMenuItem() => RestaurantMenuItem(
        categoryId: categoryId,
        categoryName: categoryName,
        name: name,
        description: description,
        imageURL: imageURL,
        extras: extras,
        isAvailable: isAvailable,
        isFeatured: isFeatured,
        listOfProductOptionCategories: listOfProductOptionCategories,
        menuItemID: menuItemID,
        price: price,
        priority: priority,
        productBarCode: productBarCode,
        restaurantID: restaurantID,
        status: status,
        brandName: brandName,
        ingredients: ingredients,
        rating: rating,
        sizeInnerUnitType: sizeInnerUnitType,
        sizeInnerUnitValue: sizeInnerUnitValue,
        stockCount: stockCount,
        stockUnitsPerProduct: stockUnitsPerProduct,
        supplier: supplier,
        taxGroup: taxGroup,
        vendorInternalId: vendorInternalId,
      );
}
