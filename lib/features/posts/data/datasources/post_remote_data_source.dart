import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> createPost({required PostModel post});
  Future<Unit> updatePost({required PostModel post});
  Future<Unit> deletePost({required int postId});
}

class PostRemoteDataSourceImplWithHttp implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> createPost({required PostModel post}) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost({required int postId}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost({required PostModel post}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
