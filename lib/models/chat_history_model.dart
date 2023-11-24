import 'package:django_chatbot_front/models/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/date_time_utils.dart';

part 'chat_history_model.freezed.dart';

@freezed
class ChatHistoryModel with _$ChatHistoryModel {
  const ChatHistoryModel._();

  const factory ChatHistoryModel({
    required int id,
    required String message,
    required Role role,
    @JsonKey(name: "created_at", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _ChatHistoryModel;

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) => _$ChatHistoryModelFromJson(json);
}
