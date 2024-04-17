import 'package:flutter/material.dart';

import 'package:fetch_data_cubit/post.dart';

// ignore: must_be_immutable
class PostDetailsView extends StatelessWidget {
  PostDetailsView({
    super.key,
    required this.post,
  });
  Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(post.title),
      ),
    );
  }
}
