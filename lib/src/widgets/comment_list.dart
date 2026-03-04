import 'package:flutter/material.dart';
import 'package:flutter_application/src/models/comment.dart';

class CommentList extends StatelessWidget {
  final List<Comment> comments;

  const CommentList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Comments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // 데이터가 없을 때의 처리도 컴포넌트 안에서 관리하면 깔끔합니다.
        if (comments.isEmpty) const Text('아직 댓글이 없습니다.'),
        ...comments.map(
          (c) => Card(
            // ListTile을 Card로 감싸서 구분감을 줌
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(
                c.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(c.body),
            ),
          ),
        ),
      ],
    );
  }
}
