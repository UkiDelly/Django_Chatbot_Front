import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({Key? key}) : super(key: key);

  @override
  _MessageInputWidgetState createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
