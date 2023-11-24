import 'package:django_chatbot_front/screen/main/states/chat_room_detail_state.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import 'message_input_widget.dart';

class ChatRoomWidget extends StatelessWidget {
  const ChatRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          const _ChatRoomHeader(),
          Divider(thickness: 2.h, color: const Color(0xffD8D8D8)),
          const Flexible(flex: 8, child: Placeholder()),
          SizedBox(height: 20.h),
          const MessageInputWidget(),
        ],
      ),
    );
  }
}

class _ChatRoomHeader extends ConsumerWidget {
  const _ChatRoomHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomName = ref.watch(chatRoomDetailStateNotifierProvider.select((value) {
      if (value.hasError || value.requireValue is! ChatRoomDetailDataState) {
        return "My Chat Bot";
      } else {
        Logger().d("${value.value}");
        return (value.value as ChatRoomDetailDataState).chatRoom.name;
      }
    }));

    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Text(
              chatRoomName,
              style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
              iconSize: 25,
            )
          ],
        ),
      ),
    );
  }
}
