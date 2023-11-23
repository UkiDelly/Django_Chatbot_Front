import 'package:django_chatbot_front/screen/login/login_screen.dart';
import 'package:django_chatbot_front/screen/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routing.g.dart';

final rootNavKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: LoginScreen.routePath,
    routes: [
      // 메인 페이지
      GoRoute(
          path: MainScreen.routePath,
          name: MainScreen.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(child: MainScreen())),

      // 로그인 페이지
      GoRoute(
          path: LoginScreen.routePath,
          name: LoginScreen.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(child: LoginScreen())),
    ],
  );
}
