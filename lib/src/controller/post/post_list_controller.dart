import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../services/post_api_service.dart';

class PostListController extends ChangeNotifier {
  final PostService _postService = PostService();

  List<Post> posts = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadPosts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners(); // View에게 "나 변했어! 다시 그려!" (setState와 유사)

    try {
      posts = await _postService.fetchPosts();
    } catch (e) {
      errorMessage = "목록을 가져오는데 실패했습니다.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}