abstract class EndPoint {
  static final accounts = _AccountsEndpoint();

  static final chat = _Chat();

  static final webSocket = _WebSocket();
}

final class _AccountsEndpoint {
  final String _accounts = "/accounts";

  String get register => "$_accounts/register";

  String get login => "$_accounts/login";

  String get refresh => "$_accounts/refresh";

  String get myInfo => "$_accounts/myinfo";
}

final class _Chat {
  String get chatRooms => "/chat";

  String chatRoom(int roomId) => "$chatRooms/$roomId";

  String chatRoomSystemPrompt(int roomId) => "$chatRooms/$roomId/system";

  String chatRoomHistory(int roomId) => "$chatRooms/$roomId/history";
}

final class _WebSocket {
  final String _chat = "/chat";

  String chatRoom(int roomId) => "$_chat/$roomId";
}
