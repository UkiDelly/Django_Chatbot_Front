import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/screen/login/login_screen.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../service/user_service.dart';

class UserProfileWidget extends ConsumerWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nickname = ref.watch(userStateServiceProvider).whenOrNull(
        data: (data) => (data as UserData).nickname,
        error: (error, stackTrace) => "XXX",
        loading: () => "XXX");

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
            const Spacer(),
            //TODO: 유저 정보
            Text(
              nickname ?? "XXX",
              style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                ref.invalidate(userStateServiceProvider);
                context.go(LoginScreen.routePath);
              },
              child: const Text("로그아웃"),
            )
          ],
        ),
      ),
    );
  }
}
