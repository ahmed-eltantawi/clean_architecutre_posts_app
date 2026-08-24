import 'package:bloc/bloc.dart';
import 'package:clean_architecutre_posts_app/core/errors/failures.dart';
import 'package:clean_architecutre_posts_app/features/posts/data/models/post_model.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecutre_posts_app/features/posts/domain/useCases/get_all_posts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPostsUsecase;
  PostsBloc({required this.getAllPostsUsecase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      emit(PostsLoadingState());

      if (event is GetAllPostsEvent) {
        final Either<Failure, List<PostEntity>> result =
            await getAllPostsUsecase.call();

        result.fold(
          (failure) => emit(PostsFailureState(failureMessage: failure.message)),
          (posts) => emit(PostsLoadedState(posts: posts)),
        );
      } else if (event is RefreshPostsEvent) {
        emit(PostsLoadingState());
      }
    });
  }
}
