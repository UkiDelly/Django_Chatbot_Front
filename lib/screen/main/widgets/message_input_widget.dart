import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../states/chat_room_detail_state.dart';
import '../states/chat_socket.dart';

class MessageInputWidget extends ConsumerStatefulWidget {
  const MessageInputWidget({super.key});

  @override
  _MessageInputWidgetState createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends ConsumerState<MessageInputWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final roomId = ref.watch(chatRoomDetailStateNotifierProvider.select((state) {
      if (state.hasError || state.requireValue is! ChatRoomDetailDataState) {
        return null;
      } else {
        return (state.value as ChatRoomDetailDataState).chatRoom.id;
      }
    }));

    if (roomId != null) {
      ref.watch(chatSocketProvider(roomId!));
    }

    return SizedBox(
      height: 100.h,
      child: Row(
        children: [
          const Spacer(),
          Flexible(
            flex: 3,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "메시지를 입력해주세요...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          IconButton(
            icon: const Icon(Icons.send_rounded),
            iconSize: 25,
            onPressed: () {
              if (roomId != null) {
                ref.read(chatSocketProvider(roomId).notifier).send("자기소개 해봐");
              }
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
