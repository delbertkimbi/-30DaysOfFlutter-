import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _user = List.filled(20, 'Delbert Drums');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            centerTitle: true,
            elevation: 0,
            bottom: const TabBar(tabs: [Text("List"), Text("Grid")]),
          ),
          body: TabBarView(children: [
            Center(
              child: _contentListView(),
            ),
            Center(
              child: _contentGridView(),
            ),
          ])),
    );
  }

  Widget _contentListView() {
    return ListView.builder(
      itemCount: _user.length,
      itemBuilder: (context, index) {
        Card(
          child: ListTile(
            title: Text(_user[index]),
            onTap: () => debugPrint("HEllo $index"),
          ),
        );
      },
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (constext, index) => Card(
                child: GridTile(
                    child: Center(
              child: Text('$index'),
            ))));
  }
}
