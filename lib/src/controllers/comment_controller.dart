import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/src/models/comment.dart';
import 'package:flutter_application/src/providers/api_providers.dart';

// 특정 포스트의 댓글 목록을 관리하는 컨트롤러 (Family 사용)
final commentListControllerProvider = AsyncNotifierProviderFamily<CommentListController, List<Comment>, int>(() {
  return CommentListController();
});

class CommentListController extends FamilyAsyncNotifier<List<Comment>, int> {
  @override
  FutureOr<List<Comment>> build(int arg) async {
    return _fetchComments(arg);
  }

  Future<List<Comment>> _fetchComments(int postId) async {
    final commentService = ref.read(commentServiceProvider);
    return await commentService.fetchComments(postId);
  }
}
