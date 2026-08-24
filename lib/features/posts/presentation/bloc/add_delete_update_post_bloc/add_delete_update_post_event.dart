part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final PostModel postModel;
  const AddPostEvent({required this.postModel});
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final PostModel postModel;
  const UpdatePostEvent({required this.postModel});
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;
  const DeletePostEvent({required this.postId});
}
