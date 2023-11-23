import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/repositories/AccountRespository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart' hide Provider;

import '../models/enums.dart';
import '../models/request_models/LoginRequestDto.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserStateService extends _$UserStateService {
  @override
  UserModel build() {
    return UserModel.empty();
  }

  Future<void> emailLogin(String email, String password) async {
    final repo = ref.read(accountRepoitoryProvider);

    final res = await repo.login(LoginReqeustDto(
        email: email, snsId: null, password: password, socialType: SocialType.email));

    state = res;
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
}
