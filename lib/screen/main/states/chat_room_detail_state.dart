import 'package:django_chatbot_front/models/chat_history_model.dart';
import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/enums.dart';
import '../../../models/system_prompt_model.dart';
import '../../../repositories/chat_repository.dart';

part 'chat_room_detail_state.freezed.dart';
part 'chat_room_detail_state.g.dart';

@Freezed(fromJson: false, toJson: false)
sealed class ChatRoomDetailState with _$ChatRoomDetailState {
  const factory ChatRoomDetailState.empty() = ChatRoomDetailEmptyState;

  const factory ChatRoomDetailState.data({
    required ChatRoomModel chatRoom,
    required List<SystemPromptModel> systemPrompt,
    required List<ChatHistoryModel> chatHistory,
  }) = ChatRoomDetailDataState;

  const factory ChatRoomDetailState.error([String? message]) = ChatRoomDetailErrorState;
}

@Riverpod(keepAlive: true)
class ChatRoomDetailStateNotifier extends _$ChatRoomDetailStateNotifier {
  @override
  FutureOr<ChatRoomDetailState> build() {
    return const ChatRoomDetailState.empty();
  }

  FutureOr<void> getChatRoomDetail(int roomId) async {
    state = const AsyncLoading();
    final repo = ref.read(chatRepositoryProvider);

    final res = await repo.getChatRoomDetail(roomId);

    if (res == null) {
      state = AsyncError(ChatRoomDetailState.error("오류가 발생했습니다."), StackTrace.empty);
    } else {
      state = AsyncData(ChatRoomDetailState.data(
        chatRoom: res.chatRoom,
        systemPrompt: res.systemPrompt,
        chatHistory: res.chatHistory,
      ));
    }
  }

  Future<void> addChat(String message, {required Role role}) async {
    if (state.value is! ChatRoomDetailDataState) {
      return;
    }
  }
}
