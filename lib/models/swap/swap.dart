import 'package:freezed_annotation/freezed_annotation.dart';

part 'swap.freezed.dart';
part 'swap.g.dart';

@immutable
@Freezed()
class TradeInfo with _$TradeInfo {
  @JsonSerializable()
  factory TradeInfo({
    required String inputAmount,
    required String outputAmount,
    required List<String> route,
    required String inputToken,
    required String outputToken,
    required String executionPrice,
    required String nextMidPrice,
    required String priceImpact,
  }) = _TradeInfo;

  factory TradeInfo.fromJson(Map<String, dynamic> json) => _$TradeInfoFromJson(json);
}

@immutable
@Freezed()
class SwapCallParameters with _$SwapCallParameters {
  @JsonSerializable()
  factory SwapCallParameters({
    required String methodName,
    required List<dynamic> args,
    required String value,
    required Map<String, dynamic> rawTxn,
  }) = _SwapCallParameters;

  factory SwapCallParameters.fromJson(Map<String, dynamic> json) => _$SwapCallParametersFromJson(json);
}

@immutable
@Freezed()
class SwapRequestBody with _$SwapRequestBody {
  @JsonSerializable()
  factory SwapRequestBody({
    @Default('') String currencyIn,
    @Default('') String currencyOut,
    @Default('') String amountIn,
    @Default('') String recipient,
  }) = _SwapRequestBody;

  factory SwapRequestBody.fromJson(Map<String, dynamic> json) => _$SwapRequestBodyFromJson(json);
}
