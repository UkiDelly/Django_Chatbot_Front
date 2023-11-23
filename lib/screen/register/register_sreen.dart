import 'package:django_chatbot_front/screen/register/widgets/register_form_widget.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterSreen extends StatelessWidget {
  const RegisterSreen({super.key});

  static const routePath = '/register';
  static const routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            //
            Text(
              "회원가입",
              style: context.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            //
            SizedBox(height: 10.h),

            //
            Text(
              "가입하고 Chat GPT와 대화 해보세요..!",
              style: context.textTheme.titleMedium,
            ),

            //
            SizedBox(height: 50.h),

            //
            SizedBox(
              width: context.width(25),
              child: RegisterFormWidget(),
            ),

            //
            Spacer(),
          ],
        ),
      ),
    );
  }
}
