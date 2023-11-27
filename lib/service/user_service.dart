import 'package:django_chatbot_front/models/request_models/register_request_dto.dart';
import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/repositories/account_repository.dart';
import 'package:django_chatbot_front/service/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart' hide Provider;

import '../models/enums.dart';
import '../models/request_models/login_request_dto.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserStateService extends _$UserStateService {
  @override
  FutureOr<UserModel> build() {
    ref.onDispose(() {
      final storage = ref.read(secureStorageProvider).deleteAll();
    });

    return autoLogin();
  }

  Future<void> emailLogin(String email, String password) async {
    state = const AsyncLoading();
    final repo = ref.read(accountRepoitoryProvider);

    final res = await repo.login(LoginReqeustDto(
        email: email, snsId: null, password: password, socialType: SocialType.email));

    if (res is UserData) {
      state = AsyncData(res);
    } else {
      state = AsyncError((res as UserModelError).message!, StackTrace.empty);
    }
  }

  FutureOr<UserModel> autoLogin() async {
    final repo = ref.read(accountRepoitoryProvider);
    final res = await repo.autoLogin();

    if (res is UserData) {
      return res;
    } else {
      return UserModel.empty();
    }
  }

  Future<void> googleLogin() async {
    //TODO: google login
    // final webClientId = dotenv.env["CLIENT_ID"]!;
    // final serverClientId = dotenv.env["CLIENT_ID"]!;
    // final googleSignIn = GoogleSignIn(clientId: webClientId);
    //
    // final googleUser = await googleSignIn.signIn();
    // print(googleUser);
    // final supabase = Supabase.instance.client;
    //
    // final googleUser = await supabase.auth.signInWithOAuth(Provider.google);
    // print(googleUser);
  }

  Future<void> register(
      {required String nickname, required String email, required String password}) async {
    state = const AsyncLoading();

    final repo = ref.read(accountRepoitoryProvider);

    final res = await repo.register(RegisterRequestDto(
      nickname: nickname,
      email: email,
      snsId: null,
      password: password,
      socialType: SocialType.email,
    ));

    if (res is UserData) {
      state = AsyncData(res);
    } else {
      state = AsyncError(res, StackTrace.empty);
    }
  }
}

@Riverpod(keepAlive: true)
class UserChatCountState extends _$UserChatCountState {
  @override
  int build() {
    final userState = ref.watch(userStateServiceProvider);
    if (userState is AsyncData) {
      return (userState.value as UserData).chatCount;
    }

    return 0;
  }

  Future<void> increaseChatCount() async {
    state += 1;
  }
}
