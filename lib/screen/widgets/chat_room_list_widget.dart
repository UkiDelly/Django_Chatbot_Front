import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomListWidget extends StatelessWidget {
  const ChatRoomListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    Text(
                      "채팅",
                      style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.create),
                      iconSize: 25,
                    )
                  ],
                ),
              )),
          SizedBox(height: 20.h),
          Flexible(flex: 8, child: Placeholder()),
          SizedBox(height: 20.h),
          Flexible(flex: 1, child: Placeholder()),
        ],
      ),
    );
  }
}
