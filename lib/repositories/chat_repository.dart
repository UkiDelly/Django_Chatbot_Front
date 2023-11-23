import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChatRepository {
  ChatRepository(this.storage, this.dio);

  final FlutterSecureStorage storage;
  final Dio dio;

  Future<void> getAllChatRoom() async {}

  Future<void> addChatRoom() async {}

  Future<void> getChatRoomDetail(int roomId) async {}

  Future<void> getChatHistory(int roomId) async {}

  Future<void> updateChatRoom(int roomId) async {}

  Future<void> deleteChatRoom(int roomId) async {}

  Future<void> addSystemPrompt(int roomId) async {}

  Future<void> updateSystemPrompt(int roomId) async {}

  Future<void> deleteSystemPrompt(int roomId) async {}
}
