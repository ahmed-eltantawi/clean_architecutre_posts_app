// This file is used to create the event of the bloc
// There are 2 events: GetAllPostsEvent and RefreshPostsEvent
part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsEvent extends PostsEvent {}

class RefreshPostsEvent extends PostsEvent {}
