import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/screen/main/main_screen.dart';
import 'package:django_chatbot_front/service/user_service.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginFormWidget extends ConsumerStatefulWidget {
  const LoginFormWidget({super.key});

  @override
  ConsumerState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends ConsumerState<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePasword = true;

  // create a function to validate email
  bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
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

    return SizedBox(
      width: context.width(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "이메일",
              style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            textField(emailController),
            SizedBox(height: 10.h),
            Text(
              "비밀번호",
              style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            textField(passwordController, passwordField: true),
            SizedBox(height: 50.h),
            SizedBox(
              height: 60.h,
              width: context.fullWith,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  textStyle: context.textTheme.labelLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: AppColor.mainColor),
                ),
                onPressed: () async {
                  await ref
                      .read(userStateServiceProvider.notifier)
                      .emailLogin(emailController.text, passwordController.text);
                },
                child: Text(
                  "로그인하기",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, {bool passwordField = false}) {
    return TextFormField(
      obscureText: passwordField ? hidePasword : false,
      validator: passwordField
          ? null
          : (value) {
              final result = validateEmail(value!);

              if (result) {
                return null;
              } else {
                return "이메일 형식이 맞지 않습니다.";
              }
            },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        constraints: BoxConstraints(minHeight: 50.h),
        suffixIcon: passwordField
            ? IconButton(
                onPressed: () => setState(() => hidePasword = !hidePasword),
                icon: Icon(hidePasword ? Icons.visibility : Icons.visibility_off))
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
