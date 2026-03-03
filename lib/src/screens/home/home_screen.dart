import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/src/controllers/post_controller.dart';
import 'package:flutter_application/app/router/router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PostListControllerProvider 구독
    final postsAsync = ref.watch(postListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(postListControllerProvider.notifier).refresh(),
          ),
        ],
      ),
      body: postsAsync.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              leading: CircleAvatar(child: Text('${post.id}')),
              title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              onTap: () {
                context.push('${Routes.post}/${post.id}');
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.read(postListControllerProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}