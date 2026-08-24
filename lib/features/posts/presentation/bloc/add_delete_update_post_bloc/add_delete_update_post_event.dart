part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final PostEntity postEntity;
  const AddPostEvent({required this.postEntity});
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final PostEntity postEntity;
  const UpdatePostEvent({required this.postEntity});
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;
  const DeletePostEvent({required this.postId});
}
