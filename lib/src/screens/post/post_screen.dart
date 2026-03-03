import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/controllers/post_controller.dart';
import 'package:flutter_application/src/controllers/comment_controller.dart';
import 'package:flutter_application/src/widgets/post_content.dart';
import 'package:flutter_application/src/widgets/comment_list.dart';

class PostScreen extends ConsumerWidget {
  final int postId;

  const PostScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 포스트 상세 정보 구독
    final postAsync = ref.watch(postDetailControllerProvider(postId));
    // 댓글 목록 구독
    final commentsAsync = ref.watch(commentListControllerProvider(postId));

    return Scaffold(
      appBar: AppBar(title: Text('Post #$postId')),
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