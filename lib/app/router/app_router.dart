import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import './router.dart'; 
import '../../src/screens/home/home_screen.dart';
import '../../src/screens/post/post_screen.dart';

final appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '${Routes.post}/:postId', // postId를 URL 매개변수로 받음
      builder: (context, state) {
        final postIdString = state.pathParameters['postId'];
        final postId = int.tryParse(postIdString ?? '');
        return PostScreen(postId: postId ?? 0);
      }
    ),
  ],

  // 404 페이지 처리 (웹의 '*' 경로와 유사)
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('페이지를 찾을 수 없습니다: ${state.uri}')),
  ),
);