// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  late String location;
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;

//

  void getData() async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=38f66eda1362364127602b56f67d779f");
    Response response = await get(url);
    Map data = jsonDecode(response.body);

    // get temp,humidity

    Map temp_data = data['main'];
    double gethumidity = temp_data['humidity'];
    double gettemp = temp_data['temp'];

    // get wind speed

    Map wind = data['wind'];
    double getair_speed = wind['speed'];

    // get description

    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getmain_des = weather_main_data['main'];
    String getdesc = weather_main_data['description'];

    // assign value

    temp = gettemp.toString();
    humidity = gethumidity.toString();
    air_speed = getair_speed.toString();
    description = getdesc;
    // main = getmain_des;
  }
}
