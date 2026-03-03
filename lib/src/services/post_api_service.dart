import 'dart:convert';
import 'package:flutter_application/src/models/post.dart';
import 'package:flutter_application/src/services/base_api_service.dart';

class PostService extends BaseApiService {
  
  // 전체 조회
  Future<List<Post>> fetchPosts() async {
    final response = await get('/posts'); // 부모의 get 메서드 사용

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Post.fromJson(item)).toList();
    }
    throw Exception('포스트 로드 실패');
  }

  // 상세 조회
  Future<Post> fetchPostDetail(int postId) async {
    final response = await get('/posts/$postId');

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('상세 로드 실패');
  }
}