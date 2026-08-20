import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/core/network/network_info.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResult = await postRemoteDataSource.getAllPosts();
        await postLocalDataSource.cachePosts(posts: remoteResult);
        return Right(remoteResult);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localResult = await postLocalDataSource.getAllCachedPosts();
        return Right(localResult);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> createPost({required PostEntity post}) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );

    if (await networkInfo.isConnected) {
      try {
        await postRemoteDataSource.createPost(post: postModel);
        return Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost({required int postId}) async {
    if (await networkInfo.isConnected) {
      try {
        await postRemoteDataSource.deletePost(postId: postId);
        return Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost({required PostEntity post}) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );

    if (await networkInfo.isConnected) {
      try {
        await postRemoteDataSource.updatePost(post: postModel);
        return Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
