import 'package:django_chatbot_front/models/user_model.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:django_chatbot_front/widgets/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../service/user_service.dart';
import '../../main/main_screen.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final formKey = GlobalKey<FormState>();
  final nickNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  bool hidePasword = true;
  bool hidePaswordConfirm = true;

  final fieldDecoration = InputDecoration(
    constraints: BoxConstraints(minHeight: 50.h),
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
  );

  bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NickName
          Text("닉네임", style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          TextFormField(
            controller: nickNameController,
            decoration: fieldDecoration,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "별명을 입력해주세요";
              } else
                return null;
            },
          ),

          //
          SizedBox(height: 20.h),

          // Email
          Text("이메일", style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          TextFormField(
            controller: emailController,
            decoration: fieldDecoration,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "이메일을 입력해주세요";
              } else if (!validateEmail(value)) {
                return "이메일 형식이 맞지 않습니다.";
              } else {
                return null;
              }
            },
          ),

          //
          SizedBox(height: 20.h),

          // Password
          Text("비밀번호", style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          TextFormField(
            controller: passwordController,
            obscureText: hidePasword,
            decoration: fieldDecoration.copyWith(
                suffixIcon: IconButton(
                    onPressed: () => setState(() => hidePasword = !hidePasword),
                    icon: Icon(hidePasword ? Icons.visibility : Icons.visibility_off))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "비밀번호을 입력해주세요";
              } else {
                return null;
              }
            },
          ),

          //
          SizedBox(height: 20.h),

          // Password Confirm
          Text("비밀번호 확인",
              style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          TextFormField(
            controller: passwordConfirmController,
            obscureText: hidePaswordConfirm,
            decoration: fieldDecoration.copyWith(
                suffixIcon: IconButton(
                    onPressed: () => setState(() => hidePaswordConfirm = !hidePaswordConfirm),
                    icon: Icon(hidePaswordConfirm ? Icons.visibility : Icons.visibility_off))),
            validator: (value) {
              if (value != passwordController.text) {
                return "비밀번호가 일치하지 않습니다.";
              } else {
                return null;
              }
            },
          ),

          SizedBox(height: 30.h),

          // 회원가입 버튼
          Consumer(builder: (context, ref, child) {
            return SizedBox(
              height: 70.h,
              width: context.fullWith,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      textStyle:
                          context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      context.showDialogWidget(const LoadingDialog());

                      await ref.read(userStateServiceProvider.notifier).register(
                          nickname: nickNameController.text,
                          email: emailController.text,
                          password: passwordController.text);

                      context.pop();

                      final userState = ref.watch(userStateServiceProvider);

                      if (userState is AsyncData) {
                        context.go(MainScreen.routePath);
                      } else if (userState is AsyncError) {
                        await context.showDialogWidget(
                            ErrorDialog((userState.error as UserModelError).message!));
                      }
                    }
                  },
                  child: const Text("가입하기")),
            );
          })
        ],
      ),
    );
  }
}
