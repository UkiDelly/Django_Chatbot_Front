import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../states/chat_room_state.dart';
import 'chat_room_card_widget.dart';
import 'user_profile_widget.dart';

class ChatRoomListWidget extends StatelessWidget {
  const ChatRoomListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      child: const Column(
        children: [
          SizedBox(child: _HeaderWidget()),
          Expanded(child: _ChatRoomListWidget()),
          UserProfileWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Text(
            "채팅",
            style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.create),
            iconSize: 20,
          )
        ],
      ),
    );
  }
}

class _ChatRoomListWidget extends ConsumerWidget {
  const _ChatRoomListWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomState = ref.watch(chatRoomStateNotifierProvider);

    return switch (chatRoomState) {
      AsyncLoading() => const CircularProgressIndicator(),
      AsyncError() => const Text("조회에 실패했습니다."),
      AsyncData() => ListView.builder(
          itemCount: chatRoomState.value.length,
          itemBuilder: (context, index) => ChatRoomCardWidget(chatRoomState.value[index]),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
