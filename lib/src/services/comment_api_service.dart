import 'dart:convert';
import 'package:flutter_application/src/models/comment.dart';
import 'package:flutter_application/src/services/base_api_service.dart';

class CommentService extends BaseApiService {

  // 특정 포스트 댓글 조회
  Future<List<Comment>> fetchComments(int postId) async {
    final response = await get('/posts/$postId/comments');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Comment.fromJson(item)).toList();
    }
    throw Exception('댓글 로드 실패');
  }
}