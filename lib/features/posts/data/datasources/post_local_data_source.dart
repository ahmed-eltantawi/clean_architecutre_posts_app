import 'dart:convert';

import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllCachedPosts();
  Future<Unit> cachePosts({required List<PostModel> posts});
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  // we take an instance of SharedPreferences to apply the dependency injection pattern
  SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences}); //Constructor

  @override
  ///This Method is used to cache the posts in the local storage
  Future<Unit> cachePosts({required List<PostModel> posts}) {
    // convert the List<PostModel> to List<Map<String, dynamic>>
    final List postModelsToJson = posts
        .map<Map<String, dynamic>>((post) => post.toJson())
        .toList();

    // save the posts in the sharedPreferences(local storage)
    sharedPreferences.setString("CACHED_POSTS", json.encode(postModelsToJson));

    // return the unit if the operation is successful
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getAllCachedPosts() {}
}
