import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/screen/main/main_screen.dart';
import 'package:django_chatbot_front/service/user_service.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/custom_dialogs.dart';

class LoginFormWidget extends ConsumerStatefulWidget {
  const LoginFormWidget({super.key});

  @override
  ConsumerState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends ConsumerState<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final enableBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(10.r));

  final errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(10.r));

  bool hidePasword = true;

  // create a function to validate email
  bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "이메일을 입력해주세요";
                }

                final result = validateEmail(value!);

                if (result) {
                  return null;
                } else {
                  return "이메일 형식이 맞지 않습니다.";
                }
              },
              decoration: InputDecoration(
                enabledBorder: enableBorder,
                focusedBorder: enableBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "비밀번호",
              style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: passwordController,
              obscureText: hidePasword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "비밀번호을 입력해주세요";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () => setState(() => hidePasword = !hidePasword),
                    icon: Icon(hidePasword ? Icons.visibility : Icons.visibility_off)),
                enabledBorder: enableBorder,
                focusedBorder: enableBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
              ),
            ),
            SizedBox(height: 30.h),
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
                  if (formKey.currentState!.validate()) {
                    context.showDialogWidget(const LoadingDialog());
                    await ref
                        .read(userStateServiceProvider.notifier)
                        .emailLogin(emailController.text, passwordController.text);

                    context.pop();

                    final userState = ref.watch(userStateServiceProvider);
                    if (userState is AsyncData) {
                      context.go(MainScreen.routePath);
                    } else {
                      await context
                          .showDialogWidget(ErrorDialog((userState as UserModelError).message!));
                    }
                  }
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
}
