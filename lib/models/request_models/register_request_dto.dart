import 'package:django_chatbot_front/models/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_dto.freezed.dart';
part 'register_request_dto.g.dart';

@freezed
class RegisterRequestDto with _$RegisterRequestDto {
  const RegisterRequestDto._();

  const factory RegisterRequestDto({
    required String nickname,
    required String email,
    @Default(null) String? snsId,
    required String password,
    required SocialType socialType,
  }) = _RegisterRequestDto;

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);
}
