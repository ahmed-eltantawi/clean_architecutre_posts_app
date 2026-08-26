import 'package:clean_architecutre_posts_app/config/services/services_locator.dart';
import 'package:clean_architecutre_posts_app/core/app_theme.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/bloc/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/bloc/get_posts_bloc/get_posts_bloc.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetPostsBloc>()..add(GetAllPostsEvent()),
        ),
        BlocProvider(create: (context) => getIt<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: PostsPage(),
      ),
    );
  }
}
