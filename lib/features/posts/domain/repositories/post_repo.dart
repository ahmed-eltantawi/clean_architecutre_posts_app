import 'package:clean_architecutre_posts_app/core/utils/typedefs.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

/// an Abstract class for the PostRepo containing the use cases
/// of the Posts Feature [getAllPosts, createPost, updatePost, deletePost]
abstract class PostRepo {
  FutureEither<List<PostEntity>> getAllPosts();
  FutureEither<Unit> createPost({required PostEntity post});
  FutureEither<Unit> updatePost({required PostEntity post});
  FutureEither<Unit> deletePost({required int postId});
}
