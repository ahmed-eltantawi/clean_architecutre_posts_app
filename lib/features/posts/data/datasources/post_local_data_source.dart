import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllCachedPosts();
  Future<Unit> cachePosts({required List<PostModel> posts});
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> cachePosts({required List<PostModel> posts}) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllCachedPosts() {
    // TODO: implement getAllCachedPosts
    throw UnimplementedError();
  }
}
