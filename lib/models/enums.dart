import 'package:freezed_annotation/freezed_annotation.dart';

enum SocialType {
  email,
  google,
}

enum Role {
  @JsonValue(1)
  user,
  @JsonValue(2)
  assistant
}
