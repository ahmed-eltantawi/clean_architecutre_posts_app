import 'package:clean_architecutre_posts_app/core/network/api_end_points.dart';
import 'package:clean_architecutre_posts_app/core/network/dio_consumer.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

/// This is the interface for the PostRemoteDataSource
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> createPost({required PostModel post});
  Future<Unit> updatePost({required PostModel post});
  Future<Unit> deletePost({required int postId});
}

/// This is the implementation of the PostRemoteDataSource
class PostRemoteDataSourceImplWithHttp implements PostRemoteDataSource {
  DioConsumer dioConsumer;

  PostRemoteDataSourceImplWithHttp({required this.dioConsumer});
  @override
  //! this method is used to get all the posts
  Future<List<PostModel>> getAllPosts() async {
    // send a get request to the api
    final response = await dioConsumer.get(EndPoint.baseUrl + EndPoint.posts);

    // convert the response to a list
    final posts = response as List;

    // convert the list to a list of PostModel and return it
    return posts.map((post) => PostModel.fromJson(post)).toList();
  }

  @override
  //! this method is used to create a post
  Future<Unit> createPost({required PostModel post}) async {
    // send a post request to the api
    await dioConsumer.post(
      EndPoint.baseUrl + EndPoint.posts,
      data: post.toJson(),
    );
    return unit;
  }

  @override
  //! this method is used to delete a post
  Future<Unit> deletePost({required int postId}) async {
    // send a delete request to the api
    await dioConsumer.delete('${EndPoint.baseUrl}${EndPoint.posts}$postId');
    return unit;
  }

  @override
  //! this method is used to update a post
  Future<Unit> updatePost({required PostModel post}) async {
    // send a put request to the api
    await dioConsumer.put(
      '${EndPoint.baseUrl}${EndPoint.posts}${post.id}',
      data: post.toJson(),
    );
    return unit;
  }
}
