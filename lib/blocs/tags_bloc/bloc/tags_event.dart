part of 'tags_bloc.dart';

abstract class TagsEvent extends Equatable {
  const TagsEvent();

  @override
  List<Object> get props => [];
}

class TagsLoadedEvent extends TagsEvent {}

class TagsAddEvent extends TagsEvent {
  final TagsModel tagsModel;

  const TagsAddEvent(this.tagsModel);

  @override
  List<Object> get props => [tagsModel];
}
