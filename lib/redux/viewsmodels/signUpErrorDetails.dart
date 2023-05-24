import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'signUpErrorDetails.freezed.dart';
part 'signUpErrorDetails.g.dart';

List<SignUpErrorDetails> fromJsonSignUpErrorDetailsList(dynamic json) =>
    fromSailsListOfObjectJson<SignUpErrorDetails>(SignUpErrorDetails.fromJson)(
      json,
    );
SignUpErrorDetails? fromJsonSignUpErrorDetails(dynamic json) =>
    fromSailsObjectJson<SignUpErrorDetails>(SignUpErrorDetails.fromJson)(json);

@Freezed()
class SignUpErrorDetails extends Equatable with _$SignUpErrorDetails {
  @JsonSerializable()
  factory SignUpErrorDetails({
    required String title,
    required String message,
    SignUpErrCode? code,
  }) = _SignUpErrorDetails;

  const SignUpErrorDetails._();

  factory SignUpErrorDetails.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$SignUpErrorDetailsFromJson(json),
      );

  @override
  String toString() {
    return 'SignUpErrorDetails [$title], message: $message, code: ${code?.name}';
  }

  @override
  List<Object?> get props => [
        title,
        message,
      ];
}
