import 'dart:convert';

import 'package:fetch_data_cubit/post.dart';
import 'package:http/http.dart' as http;

class DataService {
  final url = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Post>> getPost() async {
    try {
      final responds = await http.get(Uri.parse(url));
      final json = jsonDecode(responds.body) as List;
      final posts = json.map((postJson) => Post.fromJson(postJson)).toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
