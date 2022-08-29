part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final List<PostsModel> posts;

  const PostsLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostsErrorState extends PostsState {
  final String message;

  const PostsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
