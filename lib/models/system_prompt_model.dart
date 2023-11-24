import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/date_time_utils.dart';

part 'system_prompt_model.freezed.dart';
part 'system_prompt_model.g.dart';

@freezed
class SystemPromptModel with _$SystemPromptModel {
  const SystemPromptModel._();

  const factory SystemPromptModel({
    required int id,
    required String content,
    @JsonKey(name: "created_at", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required DateTime createdAt,
  }) = _SystemPromptModel;

  factory SystemPromptModel.fromJson(Map<String, dynamic> json) =>
      _$SystemPromptModelFromJson(json);
}
