import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/orderProductOptionValue.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed()
class Product with _$Product {
  @JsonSerializable()
  factory Product({
    required String name,
    required int basePrice,
    required List<OrderProductOptionValue> options,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  //Section Getters
  String get price => cFPrice(this.basePrice);
}
