import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_socket_models.freezed.dart';
part 'web_socket_models.g.dart';

@Freezed(toJson: false)
class WebSocketSend with _$WebSocketSend {
  const WebSocketSend._();

  const factory WebSocketSend({
    required String message,
  }) = _WebSocketSend;

  factory WebSocketSend.fromJson(Map<String, dynamic> json) => _$WebSocketSendFromJson(json);
}

@freezed
class WebSocketRecieve with _$WebSocketRecieve {
  const WebSocketRecieve._();

  const factory WebSocketRecieve({required String content}) = _WebSocketRecieve;

  factory WebSocketRecieve.fromJson(Map<String, dynamic> json) => _$WebSocketRecieveFromJson(json);
}
