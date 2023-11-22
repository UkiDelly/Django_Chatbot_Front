import 'package:django_chatbot_front/utils/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@Freezed(unionValueCase: FreezedUnionCase.snake)
class ChatRoomModel with _$ChatRoomModel {
  const ChatRoomModel._();

  const factory ChatRoomModel({
    required int id,
    required String name,
    @JsonKey(name: "created_at", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => _$ChatRoomModelFromJson(json);
}
