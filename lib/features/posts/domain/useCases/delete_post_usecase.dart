import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

class DeletePostUsecase {
  final PostRepo postRepo;
  DeletePostUsecase({required this.postRepo});

  Future<Either<Failure, Unit>> call({required int postId}) async {
    return await postRepo.deletePost(postId: postId);
  }
}
