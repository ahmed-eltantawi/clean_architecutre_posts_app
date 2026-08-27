import 'package:clean_architecutre_posts_app/core/network/dio_consumer.dart';
import 'package:clean_architecutre_posts_app/core/network/network_info.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/repositories/post_repo_impl.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/repositories/post_repo.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/create_post_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/delete_post_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/get_all_posts_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/update_post_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/bloc/get_posts_bloc/get_posts_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:clean_architecutre_posts_app/core/cache/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // all objects you want to use only on time in your app

  //! ========= Features - Posts ==========

  // ---> Bloc <---
  getIt.registerFactory(() => GetPostsBloc(getAllPostsUsecase: getIt()));
  getIt.registerFactory(
    () => AddDeleteUpdatePostBloc(
      createPostUsecase: getIt(),
      deletePostUsecase: getIt(),
      updatePostUsecase: getIt(),
    ),
  );

  // ---> Usecases <---
  getIt.registerLazySingleton(() => GetAllPostsUsecase(postRepo: getIt()));
  getIt.registerLazySingleton(() => CreatePostUsecase(postRepo: getIt()));
  getIt.registerLazySingleton(() => DeletePostUsecase(postRepo: getIt()));
  getIt.registerLazySingleton(() => UpdatePostUsecase(postRepo: getIt()));

  // ---> Repository <---
  getIt.registerLazySingleton<PostRepo>(
    () => PostRepoImpl(
      networkInfo: getIt(),
      postLocalDataSource: getIt(),
      postRemoteDataSource: getIt(),
    ),
  );

  // ---> Data Source <---

  //remote
  getIt.registerLazySingleton<PostRemoteDataSource>(
    () =>
        PostRemoteDataSourceImplWithDio(dioConsumer: DioConsumer(dio: getIt())),
  );

  //local
  getIt.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(cacheHelper: getIt()),
  );

  //! ======== Core =========
  // ---> Network Info <---
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: getIt()),
  );

  //! ======= External =========

  // ---> Shared Preferences <---
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // ---> Cache Helper <---
  getIt.registerLazySingleton(() => CacheHelper(preferences: getIt()));

  // ---> Dio <---
  getIt.registerLazySingleton(() => Dio());
  //consumer
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt()));
}
