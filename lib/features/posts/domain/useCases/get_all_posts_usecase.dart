import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUsecase {
  final PostRepo postRepo;

  GetAllPostsUsecase(this.postRepo);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepo.getAllPosts();
  }
}
