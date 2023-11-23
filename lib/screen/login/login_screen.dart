import 'package:django_chatbot_front/common/assets.dart';
import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/screen/login/widgets/login_form_widget.dart';
import 'package:django_chatbot_front/screen/register/register_sreen.dart';
import 'package:django_chatbot_front/service/user_service.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/user_model.dart';
import '../main/main_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routePath = '/login';
  static const routeName = 'login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userStateServiceProvider, (previous, next) {
      if (next is UserData) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          context.go(MainScreen.routePath);
        });
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),

            // 제목
            Text("My Chat Bot", style: context.textTheme.displayLarge),
            SizedBox(height: 10.h),

            // 부제목
            Text("Chat GPT에게 궁금한 것을 모두 물어보세요..!", style: context.textTheme.titleLarge),
            const Spacer(),

            //  로그인 폼
            const LoginFormWidget(),
            const Spacer(),

            // 회원가입, 소셜 로그인 버튼
            SizedBox(
              width: context.width(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 60.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          textStyle: context.textTheme.labelLarge!
                              .copyWith(fontWeight: FontWeight.bold, color: AppColor.mainColor),
                        ),
                        onPressed: () => context.go(RegisterSreen.routePath),
                        child: const Text("회원가입")),
                  ),
                  SizedBox(height: 20.h),
                  Consumer(builder: (context, ref, child) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      ),
                      onPressed: () async {
                        await ref.read(userStateServiceProvider.notifier).googleLogin();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(Assets.assetsGoogleLogo, width: 40.w, height: 40.h),
                            SizedBox(width: 10.w),
                            Text(
                              "Google으로 로그인",
                              style: context.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            const Spacer(),

            // Footer
            Container(
              height: 200.h,
              color: AppColor.mainColor.withOpacity(0.25),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text("My Chat Bot",
                        style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text(
                      "Copyright © Dae Hyeon Song, 2023",
                      style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      onLongPress: null,
                      onTap: () async => launchUrl(Uri.parse("https://github.com/UkiDelly"),
                          mode: LaunchMode.externalApplication),
                      child: Image.asset(Assets.assetsGithubMark, width: 50.w, height: 50.h),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
