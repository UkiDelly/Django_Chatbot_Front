import 'package:django_chatbot_front/screen/login/login_screen.dart';
import 'package:django_chatbot_front/screen/main/main_screen.dart';
import 'package:django_chatbot_front/screen/register/register_sreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user_model.dart';
import '../service/user_service.dart';

part 'routing.g.dart';

final rootNavKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: LoginScreen.routePath,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final userState = ref.watch(userStateServiceProvider).value!;

      if (userState is UserModelEmpty || userState is UserModelError) {
        return LoginScreen.routePath;
      } else {
        return null;
      }
    },
    routes: [
      // 메인 페이지
      GoRoute(
        path: MainScreen.routePath,
        name: MainScreen.routeName,
        pageBuilder: (context, state) => const NoTransitionPage(child: MainScreen()),
      ),

      // 로그인 페이지
      GoRoute(
          path: LoginScreen.routePath,
          name: LoginScreen.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(child: LoginScreen())),

      // 회원가입 페이지
      GoRoute(
          path: RegisterSreen.routePath,
          name: RegisterSreen.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(child: RegisterSreen()))
    ],
  );
}
