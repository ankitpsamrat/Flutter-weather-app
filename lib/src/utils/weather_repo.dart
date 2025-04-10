import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_app/src/utils/weather_model.dart';

class WeatherRepo {
  //

  Future<WeatherModel> getWeather(String city) async {
    final Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=38f66eda1362364127602b56f67d779f");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
