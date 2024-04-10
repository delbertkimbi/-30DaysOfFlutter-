import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRwuestToApi() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/3');
    final responds = await http.get(uri);
    return responds.body;
  }
}
