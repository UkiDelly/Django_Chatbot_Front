import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            decoration: fieldDecoration,
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
            decoration: fieldDecoration,
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
          SizedBox(
            height: 70.h,
            width: context.fullWith,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                    textStyle:
                        context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("register");
                  } else {
                    print("fail");
                  }
                },
                child: Text("가입하기")),
          )
        ],
      ),
    );
  }
}
