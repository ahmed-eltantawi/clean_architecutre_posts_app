import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEntity>> getPosts();
  Future<void> createPost();
  Future<void> updatePost();
  Future<void> deletePost();
}
