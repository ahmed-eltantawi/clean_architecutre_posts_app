import 'package:clean_architecutre_posts_app/core/app_theme.dart';
import 'package:clean_architecutre_posts_app/core/cache/cache_helper.dart';
import 'package:clean_architecutre_posts_app/core/network/dio_consumer.dart';
import 'package:clean_architecutre_posts_app/core/network/network_info.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/repositories/post_repo_impl.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/get_all_posts_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/bloc/get_posts_bloc/get_posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetPostsBloc(
            getAllPostsUsecase: GetAllPostsUsecase(
              postRepo: PostRepoImpl(
                postRemoteDataSource: PostRemoteDataSourceImplWithDio(
                  dioConsumer: DioConsumer(dio: Dio()),
                ),
                postLocalDataSource: PostLocalDataSourceImpl(
                  sharedPreferences: sharedPreferences,
                  cacheHelper: CacheHelper(),
                ),
                networkInfo: NetworkInfoImpl(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Scaffold(),
      ),
    );
  }
}
