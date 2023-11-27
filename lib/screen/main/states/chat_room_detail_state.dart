import 'package:django_chatbot_front/models/chat_history_model.dart';
import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:django_chatbot_front/screen/main/states/chat_room_state.dart';
import 'package:django_chatbot_front/screen/main/states/chat_socket.dart';
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

@riverpod
class ChatRoomDetailStateNotifier extends _$ChatRoomDetailStateNotifier {
  @override
  FutureOr<ChatRoomDetailState> build() {
    return const ChatRoomDetailState.empty();
  }

  ChatSocketState _socket = const ChatSocketState.init();

  FutureOr<void> getChatRoomDetail(int roomId) async {
    state = const AsyncLoading();
    final repo = ref.read(chatRepositoryProvider);

    final res = await repo.getChatRoomDetail(roomId);

    if (res == null) {
      state = const AsyncError(ChatRoomDetailState.error("오류가 발생했습니다."), StackTrace.empty);
    } else {
      _socket = ref.watch(chatSocketProvider(roomId));

      if (_socket is ChatSocketConnectedState) {
        (_socket as ChatSocketConnectedState).messages.listen((event) {
          addChat((event).content, role: Role.assistant);
        });
      }

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

    final oldState = state.value as ChatRoomDetailDataState;
    final newState = oldState.copyWith(chatHistory: [
      ...oldState.chatHistory,
      ChatHistoryModel(message: message, role: role, id: 0, createdAt: DateTime.now())
    ]);

    if (role == Role.user) {
      ref.read(chatSocketProvider(newState.chatRoom.id).notifier).send(message);
    }
    state = AsyncData(newState);
  }

  Future<void> createChatRoom(String message) async {
    if (state.value is ChatRoomDetailDataState) {
      return;
    }
    final repo = ref.read(chatRepositoryProvider);
    final res = await repo.createChatRoom(message);

    if (res == null) {
      state = const AsyncError(ChatRoomDetailState.error("오류가 발생했습니다."), StackTrace.empty);
    } else {
      ref.invalidate(chatRoomStateNotifierProvider);
      await getChatRoomDetail(res.id);
    }
  }
}
