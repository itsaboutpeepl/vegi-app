import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'errorDetails.freezed.dart';
part 'errorDetails.g.dart';

List<ErrorDetails> fromJsonErrorDetailsList(dynamic json) =>
    fromSailsListOfObjectJson<ErrorDetails>(ErrorDetails.fromJson)(
      json,
    );
ErrorDetails? fromJsonErrorDetails(dynamic json) =>
    fromSailsObjectJson<ErrorDetails>(ErrorDetails.fromJson)(json);

T? codeFromJson<T extends Enum>(dynamic json) {
  if (json == null) {
    return null;
  } else if (json is String) {
    if (T is CartErrCode) {
      return EnumHelpers.enumFromString<CartErrCode>(CartErrCode.values, json)
          as T?;
    } else if (T is SignUpErrCode) {
      return EnumHelpers.enumFromString<CartErrCode>(CartErrCode.values, json)
          as T?;
    } else {
      tryCatchRethrowInline(
        () => throw Exception('ErrorDetails code of ${T} not implemented'),
      );
      return null;
    }
  } else {
    return null;
  }
}

dynamic codeToJson<T extends Enum>(T? code) {
  return code?.name;
}

@Freezed()
class ErrorDetails<T extends Enum> extends Equatable with _$ErrorDetails {
  @JsonSerializable()
  factory ErrorDetails({
    required String title,
    required String message,
    @JsonKey(
      fromJson: codeFromJson,
      toJson: codeToJson,
    )
        T? code,
  }) = _ErrorDetails;

  const ErrorDetails._();

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$ErrorDetailsFromJson(json),
      );

  @override
  String toString() {
    return 'ErrorDetails [$title], message: $message, code: ${code?.name}';
  }

  @override
  List<Object?> get props => [
        title,
        message,
      ];
}
