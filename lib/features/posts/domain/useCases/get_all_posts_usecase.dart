import 'package:clean_architecutre_posts_app/core/utils/typedefs.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';

/// this use case is used to get all posts
/// it calls the [PostRepo.getAllPosts]
class GetAllPostsUsecase {
  final PostRepo postRepo;

  GetAllPostsUsecase(this.postRepo);

  FutureEither<List<PostEntity>> call() async {
    return await postRepo.getAllPosts();
  }
}
