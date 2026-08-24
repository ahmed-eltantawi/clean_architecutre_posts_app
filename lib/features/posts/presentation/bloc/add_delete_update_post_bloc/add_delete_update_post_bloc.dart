// This is the bloc for the delete, update and create post Feature
import 'package:bloc/bloc.dart';
import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/create_post_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/delete_post_usecase.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/update_post_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final CreatePostUsecase createPostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  final DeletePostUsecase deletePostUsecase;
  AddDeleteUpdatePostBloc({
    required this.createPostUsecase,
    required this.updatePostUsecase,
    required this.deletePostUsecase,
  }) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      // first emit the loading state
      emit(AddDeleteUpdatePostLoadingState());

      // check the type of the event and call the corresponding use case
      try {
        if (event is AddPostEvent) {
          //add post
          final result = await createPostUsecase(post: event.postEntity);
          emit(customFold(result, 'Post Added Successfully'));
        } else if (event is UpdatePostEvent) {
          // update post
          final result = await updatePostUsecase(post: event.postEntity);
          emit(customFold(result, 'Post Updated Successfully'));
        } else if (event is DeletePostEvent) {
          // delete post
          final result = await deletePostUsecase(postId: event.postId);
          emit(customFold(result, 'Post Deleted Successfully'));
        }
      } catch (e) {
        // if there is an error, emit the error state
        emit(AddDeleteUpdatePostErrorState(message: e.toString()));
      }
    });
  }

  /// this function is used to fold the result of the use case
  /// Used to reuse the code and make the code more readable
  AddDeleteUpdatePostState customFold(
    Either<Failure, Unit> result,
    String message,
  ) {
    return result.fold(
      (failure) => AddDeleteUpdatePostErrorState(message: failure.message),
      (r) => AddDeleteUpdatePostSuccessState(message: message),
    );
  }
}
