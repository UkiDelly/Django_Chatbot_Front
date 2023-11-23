import 'package:django_chatbot_front/screen/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final goRouter = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: MainScreen.routePath,
  routes: [
    GoRoute(
        path: MainScreen.routePath,
        name: MainScreen.routeName,
        builder: (context, state) => const MainScreen()),
  ],
);
