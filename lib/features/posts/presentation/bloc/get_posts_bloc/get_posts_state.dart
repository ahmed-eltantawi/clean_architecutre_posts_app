//? this file is used to create the state of the bloc
//? There are 4 states: initial, loading, loaded and failure
part of 'get_posts_bloc.dart';

sealed class GetPostsState extends Equatable {
  const GetPostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends GetPostsState {}

final class PostsLoadingState extends GetPostsState {}

final class PostsLoadedState extends GetPostsState {
  final List<PostEntity> posts;
  const PostsLoadedState({required this.posts});

  @override
  List<Object> get props => [posts];
}

final class PostsFailureState extends GetPostsState {
  final String message;
  const PostsFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
