import 'package:django_chatbot_front/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../token.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const LoginResponse._();

  const factory LoginResponse({
    required UserData user,
    required Token token,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@freezed
class AutoLoginResponse with _$AutoLoginResponse {
  const AutoLoginResponse._();

  const factory AutoLoginResponse({
    required UserData user,
    required String accessToken,
  }) = _AutoLoginResponse;

  factory AutoLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$AutoLoginResponseFromJson(json);
}
