import 'package:clean_architecutre_posts_app/core/utils/typedefs.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

/// this use cause is used to delete a post
/// it calls the [PostRepo.deletePost]
class DeletePostUsecase {
  final PostRepo postRepo;
  DeletePostUsecase({required this.postRepo});

  FutureEither<Unit> call({required int postId}) async {
    return await postRepo.deletePost(postId: postId);
  }
}
