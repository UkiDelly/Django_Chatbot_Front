import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 90.h,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffE1E1E1),
              radius: 30.w,
            ),
            Spacer(),
            //TODO: 유저 정보
            Text(
              "유저이름",
              style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert_rounded),
            )
          ],
        ),
      ),
    );
  }
}
