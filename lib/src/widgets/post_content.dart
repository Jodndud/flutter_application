import 'package:flutter/material.dart';
import '../models/post.dart';

class PostContent extends StatelessWidget {
  final Post post;

  const PostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title, 
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Text(
          post.body,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}