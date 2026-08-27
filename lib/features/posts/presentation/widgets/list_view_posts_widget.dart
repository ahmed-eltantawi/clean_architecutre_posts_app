import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class ListViewPostsWidget extends StatelessWidget {
  const new({super.key, required this.posts});
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return PostWidget(post: posts[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1);
      },
      itemCount: posts.length,
    );
  }
}
