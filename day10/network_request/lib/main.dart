import 'package:flutter/material.dart';
import 'package:network_request/data_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataService _dataService = DataService();
  late final String _responds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(builder: (context) {
                if (_responds != null) {
                  return Text(
                    _responds,
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                } else {
                  return ElevatedButton(
                    onPressed: _makeRequest,
                    child: const Text(
                      'Make Request',
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _makeRequest() async {
    try {
      final responds = await _dataService.makeRwuestToApi();
      setState(() {
        _responds = responds;
      });
    } catch (error) {
      // Handle the error here, potentially showing a red error message
      debugPrint("Error fetching data: $error");
    }
    debugPrint(_responds);
  }
}
