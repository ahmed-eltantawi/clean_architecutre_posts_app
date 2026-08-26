import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class ListViewPostsWidget extends StatelessWidget {
  const new({super.key, required this.posts});
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            posts[index].title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            posts[index].body,
            style: const TextStyle(fontSize: 12),
          ),
          leading: CircleAvatar(child: Text("${posts[index].id}")),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1);
      },
      itemCount: posts.length,
    );
  }
}
