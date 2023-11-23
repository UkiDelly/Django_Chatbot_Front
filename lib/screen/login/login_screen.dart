import 'package:django_chatbot_front/common/assets.dart';
import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/screen/login/widgets/login_form_widget.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routePath = '/login';
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),

            // 제목
            Text("My Chat Bot", style: context.textTheme.displayLarge),
            SizedBox(height: 10.h),

            // 부제목
            Text("Chat GPT에게 궁금한 것을 모두 물어보세요..!", style: context.textTheme.titleLarge),
            Spacer(),

            //  로그인 폼
            LoginFormWidget(),
            Spacer(),

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
                        onPressed: () {},
                        child: Text("회원가입")),
                  ),
                  SizedBox(height: 20.h),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    ),
                    onPressed: () {},
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
                  )
                ],
              ),
            ),
            Spacer(),

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
                    Spacer(),
                    Text(
                      "Copyright © Dae Hyeon Song, 2023",
                      style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
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
