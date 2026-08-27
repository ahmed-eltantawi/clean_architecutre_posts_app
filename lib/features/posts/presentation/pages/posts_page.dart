import 'package:clean_architecutre_posts_app/core/app_theme.dart';
import 'package:clean_architecutre_posts_app/core/widgets/custom_progress_indicator_widget.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/bloc/get_posts_bloc/get_posts_bloc.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/widgets/list_view_posts_widget.dart';
import 'package:clean_architecutre_posts_app/features/posts/presentation/widgets/show_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* === appBar ===
      appBar: AppBar(backgroundColor: primaryColor),

      //* === body ===
      body: BlocBuilder<GetPostsBloc, GetPostsState>(
        builder: (BuildContext context, state) {
          //* === refresh indicator ===
          return RefreshIndicator(
            onRefresh: () async {
              // refresh the posts
              context.read<GetPostsBloc>().add(RefreshPostsEvent());
            },
            // check the state of the bloc
            child: _checkState(state),
          );
        },
      ),
    );
  }

  //======================================================
  ///* this function is used to check the state of the bloc
  ///* and return the widget that corresponds to the state
  //======================================================
  Widget _checkState(GetPostsState state) {
    if (state is PostsLoadedState) {
      // If the state is PostsLoadedState return the ListViewPostsWidget
      return ListViewPostsWidget(posts: state.posts);
    } else if (state is PostsFailureState) {
      // If the state is PostsFailureState return the ShowErrorWidget
      return ShowErrorWidget(message: state.message);
    } else {
      // If the state is not PostsLoadedState or PostsFailureState return the CustomProgressIndicatorWidget
      return const CustomProgressIndicatorWidget();
    }
  }
}
