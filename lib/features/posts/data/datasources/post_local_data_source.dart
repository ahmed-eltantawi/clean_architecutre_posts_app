import 'dart:convert';

import 'package:clean_architecutre_posts_app/core/cache/cache_helper.dart';
import 'package:clean_architecutre_posts_app/core/cache/cache_key.dart';
import 'package:clean_architecutre_posts_app/core/errors/exceptions.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

/// This is the interface for the PostLocalDataSource
abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllCachedPosts();
  Future<Unit> cachePosts({required List<PostModel> posts});
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final CacheHelper cacheHelper;

  PostLocalDataSourceImpl({
    required this.cacheHelper,
  }); //Constructor

  @override
  ///!This Method is used to cache the posts in the local storage
  Future<Unit> cachePosts({required List<PostModel> posts}) async {
    // convert the List<PostModel> to List<Map<String, dynamic>>
    final List postModelsToJson = posts
        .map<Map<String, dynamic>>((post) => post.toJson())
        .toList();

    // save the encoded json string in the sharedPreferences(local storage)
    await cacheHelper.saveData(
      key: CacheKey.cachedPosts,
      value: json.encode(postModelsToJson),
    );

    // return the unit if the operation is successful
    return unit;
  }

  @override
  ///!This Method is used to get the posts from the local storage
  Future<List<PostModel>> getAllCachedPosts() async {
    // get the posts from the sharedPreferences(local storage)
    final jsonString = cacheHelper.getData(key: CacheKey.cachedPosts);

    if (jsonString != null && jsonString is String) {
      // convert the JSON string to List<dynamic>
      final List decodedJsonData = json.decode(jsonString);

      // convert the List<dynamic> to List<PostModel>
      final List<PostModel> jsonToPostModels = decodedJsonData
          .map<PostModel>((post) => PostModel.fromJson(post))
          .toList();

      return jsonToPostModels;
    } else {
      // throw an exception if the posts are not found
      throw EmptyCacheException();
    }
  }
}
