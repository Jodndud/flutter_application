import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../services/post_api_service.dart';

class PostDetailController extends ChangeNotifier {
  final PostService _postService = PostService();

  Post? post;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadPostDetail(int postId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      post = await _postService.fetchPostDetail(postId);
    } catch (e) {
      errorMessage = "상세 내용을 가져오는데 실패했습니다.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  
  // 상태 초기화 (상세 페이지 나갈 때 데이터를 비워줄 수 있음)
  void clear() {
    post = null;
    notifyListeners();
  }
}