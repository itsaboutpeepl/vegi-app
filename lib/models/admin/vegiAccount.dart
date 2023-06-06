import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';

part 'vegiAccount.freezed.dart';
part 'vegiAccount.g.dart';

@Freezed()
class VegiAccount with _$VegiAccount {
  @JsonSerializable()
  factory VegiAccount({
    required int id,
    @Default(null) VegiAccountType? accountType,
    required bool verified,
    required String walletAddress,
    @Default('') String imageUrl,
    @Default(null) String? stripeCustomerId,
    @Default(null) String? stripeAccountId,
    @Default(null) String? bankCardNumber,
    @Default(null) String? bankCardAccountName,
    @Default(null) int? bankCardExpiryDateMonth,
    @Default(null) int? bankCardExpiryDateYear,
  }) = _VegiAccount;

  const VegiAccount._();

  factory VegiAccount.fromJson(Map<String, dynamic> json) =>
      _$VegiAccountFromJson(json);
}
