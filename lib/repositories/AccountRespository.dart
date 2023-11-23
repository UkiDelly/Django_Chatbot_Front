import 'package:dio/dio.dart';
import 'package:django_chatbot_front/common/endpoints.dart';
import 'package:django_chatbot_front/models/request_models/LoginRequestDto.dart';
import 'package:django_chatbot_front/service/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/dio_service.dart';

part 'AccountRespository.g.dart';

@riverpod
AccountRepoitory accountRepoitory(AccountRepoitoryRef ref) {
  return AccountRepoitory(ref.watch(secureStorageProvider), ref.watch(dioProvider));
}

class AccountRepoitory {
  AccountRepoitory(this.storage, this.dio);

  final FlutterSecureStorage storage;
  final Dio dio;

  Future<void> login(LoginReqeustDto request) async {
    final res = await dio.post(
      "${EndPoint.accounts.login}/",
      data: request.toJson(),
    );

    print(res);
  }
}
