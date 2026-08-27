import 'dart:developer';

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
class PostRemoteDataSourceImplWithDio implements PostRemoteDataSource {
  DioConsumer dioConsumer;

  PostRemoteDataSourceImplWithDio({required this.dioConsumer});
  @override
  //! this method is used to get all the posts
  Future<List<PostModel>> getAllPosts() async {
    log("getAllPosts usecase called");
    // send a get request to the api
    final response = await dioConsumer.get(EndPoint.posts);
    log("getAllPosts usecase response: $response");
    // DummyJSON returns the collection inside the "posts" key.
    final posts = (response as Map<String, dynamic>)["posts"] as List;

    // convert the list to a list of PostModel and return it
    log("getAllPosts usecase finished");
    return posts.map((post) => PostModel.fromJson(post)).toList();
  }

  @override
  //! this method is used to create a post
  Future<Unit> createPost({required PostModel post}) async {
    // send a post request to the api
    await dioConsumer.post(EndPoint.addPost, data: post.toJson());
    return unit;
  }

  @override
  //! this method is used to delete a post
  Future<Unit> deletePost({required int postId}) async {
    // send a delete request to the api
    await dioConsumer.delete('${EndPoint.posts}/$postId');
    return unit;
  }

  @override
  //! this method is used to update a post
  Future<Unit> updatePost({required PostModel post}) async {
    // send a put request to the api
    await dioConsumer.put('${EndPoint.posts}/${post.id}', data: post.toJson());
    return unit;
  }
}
