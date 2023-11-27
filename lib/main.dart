import 'package:django_chatbot_front/common/routing.dart';
import 'package:django_chatbot_front/common/theme.dart';
import 'package:django_chatbot_front/screen/login/login_screen.dart';
import 'package:django_chatbot_front/service/user_service.dart';
import 'package:django_chatbot_front/utils/provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
  );
  runApp(ProviderScope(observers: [RiverpodObserver()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) => Consumer(
        builder: (context, ref, child) {
          WebAppReloadDetector.onReload(() async {
            ref.invalidate(userStateServiceProvider);
          });

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "DRF Chatbot",
            theme: theme,
            routerConfig: ref.watch(goRouterProvider),
            builder: (context, child) => child!,
          );
        },
      ),
      child: const LoginScreen(),
    );
  }
}
