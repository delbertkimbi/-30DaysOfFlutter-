import 'package:fetch_data_cubit/data_service.dart';
import 'package:fetch_data_cubit/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PostEvent {}

class LoadPostEvent extends PostEvent {}
class PullToRefresh extends PostEvent {}
abstract class PostState {}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  List<Post> posts;
  LoadedPostState(this.posts);
}

class ErrorPostState extends PostState {
  final String error;
  ErrorPostState(this.error);
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(LoadingPostState());
  final DataService _dataService = DataService();
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPostEvent || event is PullToRefresh)  {
      yield LoadingPostState();
      try {
        final posts = await _dataService.getPost();
        yield LoadedPostState(posts);
      } catch (e) {
        yield ErrorPostState(e.toString());
      }
    }
  }
}
