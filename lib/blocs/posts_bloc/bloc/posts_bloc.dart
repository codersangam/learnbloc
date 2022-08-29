import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learnbloc/data/repository/posts_repo.dart';
import 'package:learnbloc/models/posts_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepo postsRepo;
  PostsBloc(this.postsRepo) : super(PostsLoadingState()) {
    on<PostsEvent>((event, emit) async {
      emit(PostsLoadingState());
      try {
        var postsModel = await postsRepo.postsApi.getPosts();
        emit(PostsLoadedState(postsModel));
      } catch (e) {
        emit(PostsErrorState(e.toString()));
      }
    });
  }
}
