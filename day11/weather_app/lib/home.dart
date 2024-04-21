import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cityTextEditingController =
      TextEditingController();
  final DataService _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Text('${_responds.tempInfo?.temperature} °C'),
                        Text('${_responds.weatherInfo?.descript}'),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: _cityTextEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Enter your city',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: searchCity,
                child: const Text("Search"),
              )
            ],
          ),
        ),
      ),
    );
  }

  WeatherResponds _responds = WeatherResponds();
  bool isLoading = false;
  void searchCity() async {
    try {
      final responds =
          await _dataService.getWeather(_cityTextEditingController.text.trim());
     
      setState(() {
         print(responds);
        isLoading = false;
        _responds = responds;
      });
    } catch (e) {
      setState(() {
        isLoading = true;
        //print(e);
      });
    }
  }
}
