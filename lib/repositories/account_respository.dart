import 'package:dio/dio.dart';
import 'package:django_chatbot_front/common/endpoints.dart';
import 'package:django_chatbot_front/models/request_models/login_request_dto.dart';
import 'package:django_chatbot_front/models/request_models/register_request_dto.dart';
import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/service/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/response_models/login_response.dart';
import '../service/dio_service.dart';

part 'account_respository.g.dart';

@riverpod
AccountRepoitory accountRepoitory(AccountRepoitoryRef ref) {
  return AccountRepoitory(ref.watch(secureStorageProvider), ref.watch(dioProvider));
}

class AccountRepoitory {
  AccountRepoitory(this.storage, this.dio);

  final FlutterSecureStorage storage;
  final Dio dio;

  Future<UserModel> login(LoginReqeustDto request) async {
    try {
      final res = await dio.post(
        "${EndPoint.accounts.login}/",
        data: request.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(res.data);

      await storage
        ..write(key: "access_token", value: loginResponse.token.accessToken)
        ..write(key: "refresh_token", value: loginResponse.token.refreshToken);

      return loginResponse.user;
    } on DioException catch (e) {
      return UserModel.error("로그인에 실패했습니다.");
    }
  }

  Future<UserModel> register(RegisterRequestDto request) async {
    try {
      final res = await dio.post("${EndPoint.accounts.register}/", data: request.toJson());

      final loginResponse = LoginResponse.fromJson(res.data);
      await storage
        ..write(key: "access_token", value: loginResponse.token.accessToken)
        ..write(key: "refresh_token", value: loginResponse.token.refreshToken);

      return loginResponse.user;
    } on DioException catch (e) {
      return UserModel.error("이미 가입한 유저 또는 비밀번호가 너무 단순합니다.");
    }
  }
}
