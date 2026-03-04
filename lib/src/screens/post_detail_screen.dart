import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/controllers/post_controller.dart';
import 'package:flutter_application/src/controllers/comment_controller.dart';
import 'package:flutter_application/src/widgets/post_content.dart';
import 'package:flutter_application/src/widgets/comment_list.dart';
import 'package:flutter_application/app/router/router.dart';

class PostDetailScreen extends ConsumerWidget {
  final int postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 포스트 상세 정보 구독
    final postAsync = ref.watch(postDetailControllerProvider(postId));
    // 댓글 목록 구독
    final commentsAsync = ref.watch(commentListControllerProvider(postId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(Routes.posts),
        ),
        title: Text(postAsync.value?.title ?? 'Post Detail'),
      ),
      body: postAsync.when(
        data: (post) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostContent(post: post),
              const Divider(height: 40),
              commentsAsync.when(
                data: (comments) => CommentList(comments: comments),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Text('Comments error: $error'),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Post detail error: $error')),
      ),
    );
  }
}