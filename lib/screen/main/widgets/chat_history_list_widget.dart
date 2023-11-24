import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/models/chat_history_model.dart';
import 'package:django_chatbot_front/screen/main/states/chat_room_detail_state.dart';
import 'package:django_chatbot_front/screen/main/states/chat_socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/enums.dart';

class ChatHistoryListWidget extends ConsumerWidget {
  const ChatHistoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref.watch(chatRoomDetailStateNotifierProvider.select((state) {
      if (state.hasError || state.requireValue is! ChatRoomDetailDataState) {
        return <ChatHistoryModel>[];
      } else {
        ref.watch(chatSocketProvider((state.value as ChatRoomDetailDataState).chatRoom.id));
        return (state.value as ChatRoomDetailDataState).chatHistory;
      }
    }));

    if (historyList.isEmpty) {
      return const Center(
        child: Text("메시지가 없습니다"),
      );
    } else {
      return Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 200.w),
          itemCount: historyList.length,
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) => _Item(historyList[index]),
        ),
      );
    }
  }
}

class _Item extends StatelessWidget {
  const _Item(this.item);

  final ChatHistoryModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: item.role == Role.user ? 700.w : 0,
        right: item.role == Role.assistant ? 700.w : 0,
        top: 20.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColor.mainColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        item.message,
        textAlign: item.role == Role.user ? TextAlign.end : TextAlign.start,
      ),
    );
  }
}
