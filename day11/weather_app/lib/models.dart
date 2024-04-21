/* 
                         
{
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
    "pressure": 1015,
    "humidity": 64,
  },

  "wind": {
    "speed": 0.62,
  },
  "name": "Zocca",
}                        
                        
*/
class TempInfo {
  final double? temperature;

  TempInfo({this.temperature});
  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temp = json["temp"];
    return TempInfo(temperature: temp);
  }
}

class WeatherInfo {
  final String? descript;
  final String? icon;
  WeatherInfo({this.descript, this.icon});
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final descript = json["description"];
    final icon = json["icon"];
    return WeatherInfo(descript: descript, icon: icon);
  }
}

class WeatherResponds {
  final String? cityName;
  final WeatherInfo? weatherInfo;
  final TempInfo? tempInfo;
  WeatherResponds({this.cityName, this.weatherInfo, this.tempInfo});
  factory WeatherResponds.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final tempJson = json["main"];
    final temp = TempInfo.fromJson(tempJson);
    final weatherInfoJson = json["weather"][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponds(
        cityName: cityName, weatherInfo: weatherInfo, tempInfo: temp);
  }
}
