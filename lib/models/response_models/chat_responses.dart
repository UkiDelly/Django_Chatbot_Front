import 'package:freezed_annotation/freezed_annotation.dart';

import '../chat_room_model.dart';

part 'chat_responses.freezed.dart';
part 'chat_responses.g.dart';

@freezed
class ChatRoomsResponse with _$ChatRoomsResponse {
  const ChatRoomsResponse._();

  const factory ChatRoomsResponse({required List<ChatRoomModel> chatRooms}) = _ChatRoomsResponse;

  factory ChatRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomsResponseFromJson(json);
}
