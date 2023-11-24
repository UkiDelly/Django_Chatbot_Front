import 'package:django_chatbot_front/models/chat_room_model.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../states/chat_room_detail_state.dart';

class ChatRoomCardWidget extends ConsumerStatefulWidget {
  const ChatRoomCardWidget(this.chatRoom, {super.key});

  final ChatRoomModel chatRoom;

  @override
  ConsumerState<ChatRoomCardWidget> createState() => _ChatRoomCardWidgetState();
}

class _ChatRoomCardWidgetState extends ConsumerState<ChatRoomCardWidget> {
  bool showButton = false;

  bool selected = false;

  Color changeBg() {
    if (showButton || selected) {
      return const Color(0xffF2F2F2);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chatRoomDetailStateNotifierProvider, (previous, next) {
      if (next.hasError || next.isLoading) {
        selected = false;
        showButton = false;
      } else {
        if ((next.value as ChatRoomDetailDataState).chatRoom.id == widget.chatRoom.id) {
          selected = true;
          showButton = true;
        }
      }

      setState(() {});
    });

    return MouseRegion(
      onEnter: (event) => setState(() => showButton = true),
      onExit: (event) => setState(() => showButton = false),
      child: InkWell(
        onTap: () {
          ref
              .read(chatRoomDetailStateNotifierProvider.notifier)
              .getChatRoomDetail(widget.chatRoom.id);
        },
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(color: changeBg(), borderRadius: BorderRadius.circular(10.r)),
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
      ),
    );
  }
}
