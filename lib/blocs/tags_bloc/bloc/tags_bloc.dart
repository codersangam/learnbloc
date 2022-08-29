import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learnbloc/data/repository/posts_repo.dart';

import '../../../models/tags_model.dart';

part 'tags_event.dart';
part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  final PostsRepo postsRepo;
  TagsBloc(this.postsRepo) : super(TagsLoadingState()) {
    on<TagsLoadedEvent>((event, emit) async {
      emit(TagsLoadingState());
      try {
        var tags = await postsRepo.postsApi.getTags();
        emit(TagsLoadedState(tags));
      } catch (e) {
        emit(TagsErrorState(e.toString()));
      }
    });

    on<TagsAddEvent>((event, emit) async {
      final state = this.state;
      if (state is TagsAddState) {
        try {
          var data = await postsRepo.postsApi.postTags(TagsModel());
          emit(TagsAddState(data));
        } catch (e) {
          emit(TagsErrorState(e.toString()));
        }
      }
    });
  }
}
