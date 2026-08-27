import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const new({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        post.title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(post.body, style: const TextStyle(fontSize: 12)),
      leading: CircleAvatar(child: Text("${post.id}")),
    );
  }
}
