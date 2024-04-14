import 'package:fetch_data_cubit/cubit/post_cubit.dart';
import 'package:fetch_data_cubit/post.dart';
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
      body: BlocBuilder<PostCubit, List<Post>>(
        builder: (context, posts) {
          if(posts.isEmpty){
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true  ,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                
                title: Text(posts[index].title.toString()),
              );
            }, 
          );
        },
      ),
    );
  }
}
