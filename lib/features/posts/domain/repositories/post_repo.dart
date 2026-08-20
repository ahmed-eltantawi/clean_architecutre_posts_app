import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, Unit>> createPost({required PostEntity post});
  Future<Either<Failure, Unit>> updatePost({required PostEntity post});
  Future<Either<Failure, Unit>> deletePost({required int postId});
}

class Failure {}
