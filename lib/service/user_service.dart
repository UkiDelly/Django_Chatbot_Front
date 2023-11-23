import 'package:django_chatbot_front/repositories/AccountRespository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/enums.dart';
import '../models/request_models/LoginRequestDto.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserStateService extends _$UserStateService {
  @override
  dynamic build() {
    return null;
  }

  Future<void> login() async {
    final repo = ref.read(accountRepoitoryProvider);

    await repo.login(const LoginReqeustDto(
        email: "daehyeon@gmail.com",
        snsId: null,
        password: "wjdrmsdud0922",
        socialType: SocialType.email));
  }
}
