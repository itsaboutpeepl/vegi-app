import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'errorDetails.freezed.dart';
part 'errorDetails.g.dart';

List<ErrorDetails> fromJsonErrorDetailsList(dynamic json) =>
    fromSailsListOfObjectJson<ErrorDetails>(ErrorDetails.fromJson)(json);
ErrorDetails? fromJsonErrorDetails(dynamic json) =>
    fromSailsObjectJson<ErrorDetails>(ErrorDetails.fromJson)(json);

@Freezed()
class ErrorDetails extends Equatable with _$ErrorDetails {
  @JsonSerializable()
  factory ErrorDetails({
    required String title,
    required String message,
  }) = _ErrorDetails;

  const ErrorDetails._();

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$ErrorDetailsFromJson(json),
      );

  @override
  String toString() {
    return 'ErrorDetails [$title], message: $message';
  }

  @override
  List<Object?> get props => [
        title,
        message,
      ];
}
