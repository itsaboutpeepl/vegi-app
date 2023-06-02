import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/vendorDTO.dart';

part 'discount.freezed.dart';
part 'discount.g.dart';

List<Discount> fromJsonDiscountList(dynamic json) =>
  fromSailsListOfObjectJson<Discount>(Discount.fromJson)(json);
Discount? fromJsonDiscount(dynamic json) =>
  fromSailsObjectJson<Discount>(Discount.fromJson)(json);

@Freezed()
class Discount with _$Discount {
  @JsonSerializable()
  factory Discount({
    required int id,
    required String code,
    required num value,
    required Currency currency,
    required DiscountType discountType,
    @JsonKey(
      fromJson: jsonToTimeStamp,
      toJson: timeStampToJsonInt,
    )
        required DateTime expiryDateTime,
    required int? timesUsed,
    required int? maxUses,
    @Default(false)
        bool isEnabled,
    required String? linkedWalletAddress,
    @JsonKey()
    @Default(null)
        VendorDTO? vendor,
  }) = _Discount;

  const Discount._();

  Money get moneyAmount => Money(currency: currency, value: value);

  factory Discount.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$DiscountFromJson(json));
}