import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePasword = true;

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
                onPressed: () {},
                child: Text(
                  "로그인하기",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, {bool passwordField = false}) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        obscureText: passwordField ? hidePasword : false,
        controller: controller,
        decoration: InputDecoration(
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
        ),
      ),
    );
  }
}
