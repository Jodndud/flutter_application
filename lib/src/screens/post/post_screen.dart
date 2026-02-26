import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../models/comment.dart';
import '../../services/post/post_api_service.dart';
import '../../services/comment/comment_api_service.dart';

import '../../widgets/post_content.dart';
import '../../widgets/comment_list.dart';

class PostScreen extends StatefulWidget {
  final int postId; // 리스트에서 넘겨받을 ID

  const PostScreen({super.key, required this.postId});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostService _postService = PostService();
  final CommentService _commentService = CommentService();

  Post? _post;
  List<Comment> _comments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // 웹의 Promise.all과 동일: 두 API를 동시에 호출하여 시간을 단축합니다.
      final results = await Future.wait([
        _postService.fetchPostDetail(widget.postId),
        _commentService.fetchComments(widget.postId),
      ]);

      setState(() {
        _post = results[0] as Post;
        _comments = results[1] as List<Comment>;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post #${widget.postId}')),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView( // 웹의 overflow-y: auto 역할
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostContent(post: _post!),
                const Divider(height: 40),
                CommentList(comments: _comments),
              ],
            ),
          ),
    );
  }
}