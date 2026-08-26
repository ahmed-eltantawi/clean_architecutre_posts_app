// This is the bloc for the Posts Feature
import 'package:bloc/bloc.dart';
import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/get_all_posts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
part 'get_posts_event.dart';
part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPostsUsecase; // this is the use case
  GetPostsBloc({required this.getAllPostsUsecase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      // first emit the loading state
      emit(PostsLoadingState());

      // Make sure that the event is either GetAllPostsEvent or RefreshPostsEvent
      if (event is GetAllPostsEvent || event is RefreshPostsEvent) {
        final Either<Failure, List<PostEntity>> result =
            await getAllPostsUsecase.call();

        // fold the result
        result.fold(
          (failure) => emit(PostsFailureState(failureMessage: failure.message)),
          (posts) => emit(PostsLoadedState(posts: posts)),
        );
      } else {
        emit(PostsFailureState(failureMessage: 'Invalid event'));
      }
    });
  }
}
