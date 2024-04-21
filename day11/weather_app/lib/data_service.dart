import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService {
 Future<WeatherResponds> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '26f834c5d15526a4a96ae7c517ba1e73',
      'units': 'metric'
    };
    final uri = Uri.https(
      'https://api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );
    final responds = await http.get(uri);
    debugPrint(responds.body);
    final json = jsonDecode(responds.body);
    return WeatherResponds.fromJson(json);
  }
}
