import 'package:clean_architecutre_posts_app/core/utils/typedefs.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

/// it takes a [PostEntity] as a parameter
/// it calls the [PostRepo.createPost]
class CreatePostUsecase {
  final PostRepo postRepo;
  CreatePostUsecase(this.postRepo);

  FutureEither<Unit> call({required PostEntity post}) async {
    return await postRepo.createPost(post: post);
  }
}
