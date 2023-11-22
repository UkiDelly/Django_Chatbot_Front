import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../states/chat_room_state.dart';

class ChatRoomListWidget extends StatelessWidget {
  const ChatRoomListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Flexible(flex: 1, child: _HeaderWidget()),
          SizedBox(height: 20.h),
          const Flexible(flex: 8, child: _ChatRoomListWidget()),
          SizedBox(height: 20.h),
          const Flexible(flex: 1, child: Placeholder()),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Text(
            "채팅",
            style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.create),
            iconSize: 25,
          )
        ],
      ),
    );
  }
}

class _ChatRoomListWidget extends ConsumerWidget {
  const _ChatRoomListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomState = ref.watch(chatRoomStateNotifierProvider);

    return switch (chatRoomState) {
      AsyncLoading() => const CircularProgressIndicator(),
      AsyncError() => Text(chatRoomState.error.toString()),
      AsyncData() => ListView.builder(
          itemCount: chatRoomState.value.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10.w),
                Text(chatRoomState.value[index].name, style: context.textTheme.titleMedium),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
              ],
            ),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
