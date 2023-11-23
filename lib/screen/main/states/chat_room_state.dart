import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:django_chatbot_front/repositories/chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_room_state.g.dart';

@riverpod
class ChatRoomStateNotifier extends _$ChatRoomStateNotifier {
  @override
  FutureOr<List<ChatRoomModel>> build() {
    return getChatRoomList();
  }

  FutureOr<List<ChatRoomModel>> getChatRoomList() async {
    final repo = ref.read(chatRepositoryProvider);
    final res = await repo.getAllChatRoom();
    return res;
  }
}
