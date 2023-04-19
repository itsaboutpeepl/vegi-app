import 'package:freezed_annotation/freezed_annotation.dart';

part 'postVegiResponse.freezed.dart';
part 'postVegiResponse.g.dart';

@Freezed()
class PostVegiResponse with _$PostVegiResponse {
  @JsonSerializable()
  factory PostVegiResponse({
    required String url,
    required String uid,
  }) = _PostVegiResponse;

  const PostVegiResponse._();

  factory PostVegiResponse.fromJson(Map<String, dynamic> json) =>
      _$PostVegiResponseFromJson(json);
}
