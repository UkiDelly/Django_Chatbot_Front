import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomWidget extends StatelessWidget {
  const ChatRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
