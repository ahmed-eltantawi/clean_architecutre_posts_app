// This file is used to create the state of the bloc
// There are 4 states: initial, loading, loaded and failure
part of 'add_delete_update_post_bloc.dart';

// abstract class for the states
sealed class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  // equatable package to compare the events
  @override
  List<Object> get props => [];
}

// initial state
final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

// loading state
final class AddDeleteUpdatePostLoadingState extends AddDeleteUpdatePostState {}

// error state
final class AddDeleteUpdatePostErrorState extends AddDeleteUpdatePostState {
  final String message;
  const AddDeleteUpdatePostErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

// success state
final class AddDeleteUpdatePostSuccessState extends AddDeleteUpdatePostState {
  final String message;
  const AddDeleteUpdatePostSuccessState({required this.message});
  @override
  List<Object> get props => [message];
}
