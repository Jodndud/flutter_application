import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/app/router/router.dart';
import 'package:flutter_application/src/screens/home_screen.dart';
import 'package:flutter_application/src/screens/posts_screen.dart';
import 'package:flutter_application/src/screens/post_detail_screen.dart';
import 'package:flutter_application/src/screens/photos_screen.dart';
import 'package:flutter_application/src/screens/photo_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: Routes.posts,
      builder: (context, state) => const PostsScreen(),
    ),

    GoRoute(
      path: '${Routes.post}/:postId',
      builder: (context, state) {
        final postIdString = state.pathParameters['postId'];
        final postId = int.tryParse(postIdString ?? '');
        return PostDetailScreen(postId: postId ?? 0);
      }
    ),

    GoRoute(
      path: Routes.photos,
      builder: (context, state) => const PhotosScreen(),
    ),

    GoRoute(
      path: '${Routes.photo}/:photoId',
      builder: (context, state) {
        final photoIdString = state.pathParameters['photoId'];
        final photoId = int.tryParse(photoIdString ?? '');
        return PhotoDetailScreen(photoId: photoId ?? 0);
      }
    ),
  ],

  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('페이지를 찾을 수 없습니다: ${state.uri}')),
  ),
);