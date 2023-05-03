import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';

part 'green_bean_token.freezed.dart';
part 'green_bean_token.g.dart';

@Freezed()
class GreenBeanToken with _$GreenBeanToken {
  @JsonSerializable()
  factory GreenBeanToken({
    required num amount,
  }) = _GreenBeanToken;

  const GreenBeanToken._();

  Currency get currency => Currency.GBT;

  factory GreenBeanToken.fromJson(Map<String, dynamic> json) =>
      _$GreenBeanTokenFromJson(json);
}
