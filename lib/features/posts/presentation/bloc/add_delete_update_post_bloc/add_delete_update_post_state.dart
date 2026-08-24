part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostLoadingState extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostErrorState extends AddDeleteUpdatePostState {
  final String message;
  const AddDeleteUpdatePostErrorState({required this.message});
}

final class AddDeleteUpdatePostSuccessState extends AddDeleteUpdatePostState {
  final String message;
  const AddDeleteUpdatePostSuccessState({required this.message});
}
