import 'package:django_chatbot_front/screen/login/widgets/login_form_widget.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routePath = '/login';
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Chat Bot", style: context.textTheme.displayLarge),
            SizedBox(height: 10.h),
            Text("Chat GPT에게 궁금한 것을 모두 물어보세요..!", style: context.textTheme.titleLarge),
            LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}
