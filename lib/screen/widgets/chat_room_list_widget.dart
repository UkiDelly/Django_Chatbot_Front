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
          Flexible(flex: 1, child: Placeholder()),
          SizedBox(height: 20.h),
          Flexible(flex: 8, child: Placeholder()),
          SizedBox(height: 20.h),
          Flexible(flex: 1, child: Placeholder()),
        ],
      ),
    );
  }
}
