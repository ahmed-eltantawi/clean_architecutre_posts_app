import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

/// this use case is used to update a post
/// it calls the [PostRepo.updatePost]
class UpdatePostUsecase {
  final PostRepo postRepo;
  UpdatePostUsecase(this.postRepo);

  Future<Either<Failure, Unit>> call({required PostEntity post}) async {
    return await postRepo.updatePost(post: post);
  }
}
