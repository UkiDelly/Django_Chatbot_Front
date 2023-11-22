abstract class EndPoint {
  static final accounts = _AccountsEndpoint();

  static final chat = _Chat();

  static final webSocket = _WebSocket();
}

final class _AccountsEndpoint {
  final String accounts = "/accounts";

  String get register => "$accounts/register";

  String get login => "$accounts/login";

  String get refresh => "$accounts/refresh";

  String get myInfo => "$accounts/myinfo";
}

final class _Chat {
  String get chatRooms => "/chat";

  String chatRoom(int roomId) => "$chatRooms/$roomId";

  String chatRoomHistory(int roomId) => "$chatRooms/$roomId/history";
}

final class _WebSocket {
  final String webSocket = "/ws";

  String chatRoom(int roomId) => "$webSocket/chat/$roomId";
}
