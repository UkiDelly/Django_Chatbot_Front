import 'package:dio/dio.dart';
import 'package:django_chatbot_front/common/endpoints.dart';
import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:django_chatbot_front/models/response_models/chat_responses.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/dio_service.dart';
import '../service/storage_service.dart';

part 'chat_repository.g.dart';

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepository(ref.watch(secureStorageProvider), ref.watch(dioProvider));
}

class ChatRepository {
  ChatRepository(this.storage, this.dio);

  final FlutterSecureStorage storage;
  final Dio dio;

  Future<void> addAccessToken() async {
    final accessToken = await storage.read(key: "access_token");
    dio.options.headers.addAll({"Authorization": "Bearer $accessToken"});
  }

  Future<List<ChatRoomModel>> getAllChatRoom() async {
    await addAccessToken();
    final res = await dio.get("${EndPoint.chat.chatRooms}/");
    final resModel = ChatRoomsResponse.fromJson(res.data);
    return resModel.chatRooms;
  }

  Future<void> addChatRoom() async {}

  Future<ChatRoomDetailResponse?> getChatRoomDetail(int roomId) async {
    await addAccessToken();
    try {
      final res = await dio.get("${EndPoint.chat.chatRoom(roomId)}/");
      final resModel = ChatRoomDetailResponse.fromJson(res.data);
      return resModel;
    } on DioException catch (e) {
      return null;
    }
  }

  Future<void> getChatHistory(int roomId) async {}

  Future<void> updateChatRoom(int roomId) async {}

  Future<void> deleteChatRoom(int roomId) async {}

  Future<void> addSystemPrompt(int roomId) async {}

  Future<void> updateSystemPrompt(int roomId) async {}

  Future<void> deleteSystemPrompt(int roomId) async {}
}
