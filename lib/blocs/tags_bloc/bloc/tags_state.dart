part of 'tags_bloc.dart';

abstract class TagsState extends Equatable {
  const TagsState();

  @override
  List<Object> get props => [];
}

class TagsLoadingState extends TagsState {}

class TagsLoadedState extends TagsState {
  const TagsLoadedState(this.tags);

  final List<TagsModel> tags;

  @override
  List<Object> get props => [tags];
}

class TagsSuccessState extends TagsState {
  const TagsSuccessState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class TagsAddState extends TagsState {
  const TagsAddState(this.tags);

  final List<TagsModel> tags;

  @override
  List<Object> get props => [tags];
}

class TagsErrorState extends TagsState {
  const TagsErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
