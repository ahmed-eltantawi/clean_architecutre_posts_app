// This file is used to create the event of the bloc
// There are 3 events: add, update and delete

part of 'add_delete_update_post_bloc.dart';

// abstract class for the events
sealed class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  // equatable package to compare the events
  @override
  List<Object> get props => [];
}

// Add post event
class AddPostEvent extends AddDeleteUpdatePostEvent {
  final PostEntity postEntity;
  const AddPostEvent({required this.postEntity});
  @override
  List<Object> get props => [postEntity];
}

// Update post event
class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final PostEntity postEntity;
  const UpdatePostEvent({required this.postEntity});
  @override
  List<Object> get props => [postEntity];
}

// Delete post event
class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;
  const DeletePostEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}
