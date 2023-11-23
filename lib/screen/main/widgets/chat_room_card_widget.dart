import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomCardWidget extends StatefulWidget {
  const ChatRoomCardWidget(this.chatRoom, {super.key});

  final ChatRoomModel chatRoom;

  @override
  State<ChatRoomCardWidget> createState() => _ChatRoomCardWidgetState();
}

class _ChatRoomCardWidgetState extends State<ChatRoomCardWidget> {
  bool showButton = false;

  Color changeBgOnHover(bool isHover) {
    if (isHover) {
      return const Color(0xffF2F2F2);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => showButton = true),
      onExit: (event) => setState(() => showButton = false),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: changeBgOnHover(showButton), borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            Text(widget.chatRoom.name,
                style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            Visibility.maintain(
              visible: showButton,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}
