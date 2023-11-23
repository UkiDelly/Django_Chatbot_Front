import 'package:django_chatbot_front/screen/widgets/message_input_widget.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomWidget extends StatelessWidget {
  const ChatRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          _ChatRoomHeader(),
          Divider(thickness: 2.h, color: Color(0xffD8D8D8)),
          Flexible(flex: 8, child: Placeholder()),
          SizedBox(height: 20.h),
          MessageInputWidget(),
        ],
      ),
    );
  }
}

class _ChatRoomHeader extends StatelessWidget {
  const _ChatRoomHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Text(
              "My Chat Bot",
              style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert_rounded),
              iconSize: 25,
            )
          ],
        ),
      ),
    );
  }
}
