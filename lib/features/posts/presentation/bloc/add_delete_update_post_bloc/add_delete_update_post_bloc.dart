import 'package:bloc/bloc.dart';
import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/core/utils/typedefs.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
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
      emit(AddDeleteUpdatePostLoadingState());
      if (event is AddPostEvent) {
        final result = await createPostUsecase(post: event.postEntity);
        customFold(result, 'Post Added Successfully');
      } else if (event is UpdatePostEvent) {
        final result = await updatePostUsecase(post: event.postEntity);
        customFold(result, 'Post Updated Successfully');
      } else if (event is DeletePostEvent) {
        final result = await deletePostUsecase(postId: event.postId);
        customFold(result, 'Post Deleted Successfully');
      }
    });
  }
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
