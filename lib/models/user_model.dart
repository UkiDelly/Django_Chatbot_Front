import 'package:django_chatbot_front/models/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  factory UserModel.empty() = UserModelEmpty;

  factory UserModel.error(String? message) = UserModelError;

  const factory UserModel.data({
    required int id,
    required String nickname,
    required String email,
    required String? snsId,
    required SocialType socialType,
    required int chatCount,
  }) = UserData;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
