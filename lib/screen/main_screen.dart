import 'package:django_chatbot_front/screen/widgets/chat_room_list_widget.dart';
import 'package:django_chatbot_front/screen/widgets/chat_room_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const routePath = '/main';
  static const routeName = 'main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: ChatRoomListWidget(),
            ),
            VerticalDivider(
              thickness: 3.w,
              color: Color(0xffD8D8D8),
            ),
            Flexible(
              flex: 8,
              child: ChatRoomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
