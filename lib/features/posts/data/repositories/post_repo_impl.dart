import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/core/network/network_info.dart';
import 'package:clean_architecutre_posts_app/core/utils/typedefs.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

/// This is the implementation of the PostRepo
/// which do four use cases [getAllPosts, createPost, updatePost, deletePost]
/// It deal with the local and remote data sources
class PostRepoImpl extends PostRepo {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetworkInfo networkInfo;

  new({
    required this.postRemoteDataSource,
    required this.postLocalDataSource,
    required this.networkInfo,
  });

  @override
  /// return the list of posts or a failure
  /// if the device is not connected to the internet, it will return the cached posts
  /// if the device is connected to the internet, it will return the remote posts
  FutureEither<List<PostEntity>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResult = await postRemoteDataSource.getAllPosts();
        await postLocalDataSource.cachePosts(posts: remoteResult);
        return Right(remoteResult);
      } catch (e) {
        return Left(
          ServerFailure(message: "There was a problem with the server"),
        );
      }
    } else {
      try {
        final localResult = await postLocalDataSource.getAllCachedPosts();
        return Right(localResult);
      } catch (e) {
        return Left(
          CacheFailure(message: 'There was a problem with the cache'),
        );
      }
    }
  }

  @override
  FutureEither<Unit> createPost({required PostEntity post}) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );

    return await _call(() {
      return postRemoteDataSource.createPost(post: postModel);
    });
  }

  @override
  FutureEither<Unit> deletePost({required int postId}) async {
    return await _call(() {
      return postRemoteDataSource.deletePost(postId: postId);
    });
  }

  @override
  FutureEither<Unit> updatePost({required PostEntity post}) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _call(() {
      return postRemoteDataSource.updatePost(post: postModel);
    });
  }

  /// This is a private helper function to make the code more readable
  /// and to avoid duplicated code
  FutureEither<Unit> _call(Future<Unit> Function() function) async {
    if (await networkInfo.isConnected) {
      try {
        await function();
        return Right(unit);
      } catch (e) {
        return Left(
          ServerFailure(message: "There was a problem with the server"),
        );
      }
    } else {
      return Left(OfflineFailure(message: "You are offline"));
    }
  }
}
