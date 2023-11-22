import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_room_state.g.dart';

@riverpod
class ChatRoomStateNotifier extends _$ChatRoomStateNotifier {
  @override
  FutureOr<List<ChatRoomModel>> build() {
    return [];
  }
}
