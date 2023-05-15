import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/userDTO.dart';

part 'vegiSession.freezed.dart';
part 'vegiSession.g.dart';

@Freezed()
class VegiSession with _$VegiSession {
  @JsonSerializable()
  factory VegiSession({
    required String sessionCookie,
    @Default(null) UserDTO? user,
  }) = _VegiSession;

  final createdAt = DateTime.now();

  VegiSession._();

  factory VegiSession.fromJson(Map<String, dynamic> json) =>
      _$VegiSessionFromJson(json);
}
