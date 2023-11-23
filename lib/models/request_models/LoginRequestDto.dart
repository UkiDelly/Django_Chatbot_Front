import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'LoginRequestDto.freezed.dart';
part 'LoginRequestDto.g.dart';

@freezed
class LoginReqeustDto with _$LoginReqeustDto {
  const LoginReqeustDto._();

  const factory LoginReqeustDto({
    required String email,
    required String? snsId,
    required String password,
    required SocialType socialType,
  }) = _LoginReqeustDto;

  factory LoginReqeustDto.fromJson(Map<String, dynamic> json) => _$LoginReqeustDtoFromJson(json);
}
