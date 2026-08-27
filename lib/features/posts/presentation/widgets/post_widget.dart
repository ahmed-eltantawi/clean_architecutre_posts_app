import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const new({super.key, required this.post});
  // Inject the PostEntity
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    // GestureDetector
    return GestureDetector(
      onTap: () {},

      // ListTile
      child: ListTile(
        // title
        title: Text(
          post.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        // subtitle
        subtitle: Text(post.body, style: const TextStyle(fontSize: 12)),

        // leading (Number of post)
        leading: CircleAvatar(child: Text("${post.id}")),
      ),
    );
  }
}
