import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

class CreatePostUsecase {
  final PostRepo postRepo;
  CreatePostUsecase(this.postRepo);

  Future<Either<Failure, Unit>> call({required PostEntity post}) async {
    return await postRepo.createPost(post: post);
  }
}
