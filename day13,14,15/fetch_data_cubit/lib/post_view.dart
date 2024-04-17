import 'package:fetch_data_cubit/cubit/nav_cubit.dart';
import 'package:fetch_data_cubit/cubit/post_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostViewPage extends StatefulWidget {
  const PostViewPage({super.key});

  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedPostState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<PostBloc>(context).add(PullToRefresh()),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title.toString()),
                    onTap: () => BlocProvider.of<NavCubit>(context)
                        .showPostDetails(state.posts[index]),
                  );
                },
              ),
            );
          } else if (state is ErrorPostState) {
            return Center(child: Text("An error occurred ${state.error}"));
          } else {
            return Center(child: Container());
          }
        },
      ),
    );
  }
}
