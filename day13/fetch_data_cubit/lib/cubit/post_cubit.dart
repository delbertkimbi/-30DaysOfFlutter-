import 'package:fetch_data_cubit/data_service.dart';
import 'package:fetch_data_cubit/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<List<Post>> {
  PostCubit() : super([]);
  final DataService _dataService = DataService();
  void getPost()async => emit(await _dataService.getPost() );
}
