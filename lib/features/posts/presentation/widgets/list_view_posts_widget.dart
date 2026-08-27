import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';

/// this widget is used to display the list of posts
class ListViewPostsWidget extends StatelessWidget {
  const new({super.key, required this.posts});
  // injection the List of Posts
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    //* === separated list view ===
    return ListView.separated(
      // physics
      physics: const BouncingScrollPhysics(),

      // item builder
      itemBuilder: (context, index) {
        return PostWidget(post: posts[index]);
      },

      // separator
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1);
      },

      // item count
      itemCount: posts.length,
    );
  }
}
