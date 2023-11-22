import 'package:django_chatbot_front/common/routing.dart';
import 'package:django_chatbot_front/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) => MaterialApp.router(
        title: "DRF Chatbot",
        theme: theme,
        routerConfig: goRouter,
        builder: (context, child) => child!,
      ),
    );
  }
}
