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
      appBar: AppBar(backgroundColor: primaryColor),
      body: BlocBuilder<GetPostsBloc, GetPostsState>(
        builder: (BuildContext context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<GetPostsBloc>().add(RefreshPostsEvent());
            },
            child: _checkState(state),
          );
        },
      ),
    );
  }

  Widget _checkState(GetPostsState state) {
    if (state is PostsLoadedState) {
      return ListViewPostsWidget(posts: state.posts);
    } else if (state is PostsFailureState) {
      return ShowErrorWidget(message: state.message);
    } else {
      return const CustomProgressIndicatorWidget();
    }
  }
}
