//? this file is used to create the state of the bloc
//? There are 4 states: initial, loading, loaded and failure
part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsLoadedState extends PostsState {
  final List<PostModel> posts;
  const PostsLoadedState({required this.posts});

  @override
  List<Object> get props => [posts];
}

final class PostsFailureState extends PostsState {
  final Failure failure;
  const PostsFailureState({required this.failure});

  @override
  List<Object> get props => [failure];
}
