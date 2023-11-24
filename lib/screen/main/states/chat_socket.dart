import 'dart:async';

import 'package:django_chatbot_front/models/web_socket_models.dart';
import 'package:django_chatbot_front/service/user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../../../common/endpoints.dart';

part 'chat_socket.freezed.dart';
part 'chat_socket.g.dart';

@Freezed(toJson: false, fromJson: false)
class ChatSocketState with _$ChatSocketState {
  const factory ChatSocketState.init() = ChatSocketInitialState;

  const factory ChatSocketState.connected(Stream<dynamic> messages) = ChatSocketConnectedState;

  const factory ChatSocketState.disconnected() = ChatSocketDisconnectedState;
}

@riverpod
class ChatSocket extends _$ChatSocket {
  @override
  ChatSocketState build(int roomId) {
    _socket = WebSocket(Uri.parse("ws://localhost:8000${EndPoint.webSocket.chatRoom(roomId)}/"));

    final userState = ref.watch(userStateServiceProvider);

    if (userState is! AsyncData) {
      return const ChatSocketState.init();
    }

    _socket.connection.listen((event) {
      if (event is Connected) {
        _logger.i("소켓에 연결되었습니다.");
      } else if (event is Connecting) {
        _logger.i("연결중입니다.");
      } else if (event is Error) {
        _logger.e(event);
      }
    });

    final convertedMessages =
        _socket.messages.map((event) => WebSocketRecieve(content: event as String));

    return ChatSocketState.connected(convertedMessages);
  }

  final Logger _logger = Logger();

  // late final Socket _socket;
  late final WebSocket _socket;

  void send(String message) {
    final convertedMessage = WebSocketSend(message: message);

    Logger().d(convertedMessage);

    _socket.send(convertedMessage.message);
  }
}
