import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/utils/data.dart';

// class LoadingPage extends StatefulWidget {
//   const LoadingPage({Key? key}) : super(key: key);

//   @override
//   State<LoadingPage> createState() => _LoadingPageState();
// }

// class _LoadingPageState extends State<LoadingPage> {
//   late String temp;
//   late String hum;
//   late String air_speed;
//   late String des;
//   late String main;

//   void startApp() async {
//     worker instance = worker(location: "Bhopal");
//     await instance.getData();

//     temp = instance.temp;
//     hum = instance.humidity;
//     air_speed = instance.air_speed;
//     des = instance.description;
//     main = instance.main;

//     Navigator.pushNamed(context, '/homepage');

//     @override
//     void initState() {
//       startApp();
//       super.initState();
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: SafeArea(child: Text("Loading")),
//       );
//     }
//   }
// }

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;
  late String city = 'Varanasi';
  //
  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    //
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temp,
      "hum_value": hum,
      "air_speed_value": air_speed,
      "des_value": des,
      "main_value": main,
      "icon_value": icon,
      "city_value": city,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    Map search = ModalRoute.of(context)!.settings.arguments as Map;
    if (search?.isNotEmpty ?? true) {
      city = search['searchText'];
    }
    startApp(city);
    //
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mlogo.png',
              height: 250,
              width: 250,
            ),
            Text(
              'WELCOME !',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Made By SAMRAT',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SpinKitWave(
              color: Colors.greenAccent,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
