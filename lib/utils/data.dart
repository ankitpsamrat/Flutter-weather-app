// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';

// late String location;
// class Worker {

//   late String temp;
//   late String humidity;
//   late String air_speed;
//   late String description;
//   late String main;

//

// Future<void> getData() async {
//   var url = Uri.parse(
//       "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=38f66eda1362364127602b56f67d779f");
//   Response response = await get(url);
// Map data = jsonDecode(response.body);

// get temp,humidity

//     Map temp_data = data['main'];
//     double gethumidity = temp_data['humidity'];
//     double gettemp = temp_data['temp'];

//     // get wind speed

//     Map wind = data['wind'];
//     double getair_speed = wind['speed'];

//     // get description

//     List weather_data = data['weather'];
//     Map weather_main_data = weather_data[0];
//     String getmain_des = weather_main_data['main'];
//     String getdesc = weather_main_data['description'];

//     // assign value

//     temp = gettemp.toString();
//     humidity = gethumidity.toString();
//     air_speed = getair_speed.toString();
//     description = getdesc;
//     main = getmain_des;
//   }
// }

class worker {
  String location;

  //Constructor

  worker({
    required this.location,
  }) {
    location = location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;

  //method

  Future<void> getData() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=38f66eda1362364127602b56f67d779f");
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      //Getting Temp,Humidiy

      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //Getting air_speed

      Map wind = data['wind'];
      double getAir_speed = wind["speed"]/0.27777777777778;

      //Getting Description

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      //Assigning Values

      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
    } catch (e) {
      temp = 'Can not find data';
      humidity = 'Can not find data';
      air_speed = 'Can not find data';
      description = 'Can not find data';
      main = 'Can not find data';
    }
  }
}
