import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  String location;

  Worker({
    required this.location,
  }) {
    location = location;
  }

  late String temp;
  late String humidity;
  late String airSpeed;
  late String description;
  late String main;
  late String icon;

  //method

  Future<void> getData() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=38f66eda1362364127602b56f67d779f");
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      //Getting Temp,Humidiy

      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      //Getting air_speed

      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      //Getting Description

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];

      //Assigning Values

      temp = getTemp.toString();
      humidity = getHumidity;
      airSpeed = getAirSpeed.toString();
      description = getDesc;
      main = getMainDes;
      icon = weatherMainData['icon'].toString();
    } catch (e) {
      temp = 'NA';
      humidity = 'NA';
      airSpeed = 'NA';
      description = 'Can not find data';
      main = 'NA';
      icon = 'NA';
    }
  }
}
