import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/models/post.dart';
import 'package:flutter_application/src/providers/api_providers.dart';

// 전체 포스트 목록을 관리하는 컨트롤러
final postListControllerProvider = AsyncNotifierProvider<PostListController, List<Post>>(() {
  return PostListController();
});

class PostListController extends AsyncNotifier<List<Post>> {
  @override
  FutureOr<List<Post>> build() async {
    return _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    final postService = ref.read(postServiceProvider);
    return await postService.fetchPosts();
  }

  // 새로고침 기능
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPosts());
  }
}

// 특정 포스트 상세 정보를 관리하는 컨트롤러 (Family 사용)
final postDetailControllerProvider = AsyncNotifierProviderFamily<PostDetailController, Post, int>(() {
  return PostDetailController();
});

class PostDetailController extends FamilyAsyncNotifier<Post, int> {
  @override
  FutureOr<Post> build(int arg) async {
    return _fetchPostDetail(arg);
  }

  Future<Post> _fetchPostDetail(int postId) async {
    final postService = ref.read(postServiceProvider);
    return await postService.fetchPostDetail(postId);
  }
}
