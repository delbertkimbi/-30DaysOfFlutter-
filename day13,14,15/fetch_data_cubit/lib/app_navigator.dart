import 'package:fetch_data_cubit/cubit/nav_cubit.dart';
import 'package:fetch_data_cubit/post.dart';
import 'package:fetch_data_cubit/post_details.dart';
import 'package:fetch_data_cubit/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(
      builder: (context, state) {
        return Navigator(
          pages: [
            const MaterialPage(child: PostViewPage()),
            if (state != null) MaterialPage(child: PostDetailsView(post: state))
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).popToPosts();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
