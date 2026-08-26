//? this file is used to create the state of the bloc
//? There are 4 states: initial, loading, loaded and failure
part of 'get_posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsLoadedState extends PostsState {
  final List<PostEntity> posts;
  const PostsLoadedState({required this.posts});

  @override
  List<Object> get props => [posts];
}

final class PostsFailureState extends PostsState {
  final String failureMessage;
  const PostsFailureState({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}
