import 'package:django_chatbot_front/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h),
          const CircularProgressIndicator(),
          SizedBox(height: 15.h),
          Text(
            "잠시만 기다려주세요",
            style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h),
          Icon(Icons.error_outline, color: Colors.red, size: 40.sp),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              message,
              style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: 300.w,
            child: ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              ),
              child: Text("확인",
                  style: context.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
