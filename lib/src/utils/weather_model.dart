class WeatherModel {
  final double temp;
  final double pressure;
  final double humidity;
  final double tempMax;
  final double tempMin;

  double get getTemp => temp - 273.15;
  double get getMaxTemp => tempMax - 273.15;
  double get getMinTemp => tempMin - 273.15;

  WeatherModel({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.tempMax,
    required this.tempMin,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'];

    return WeatherModel(
      temp: (main["temp"] ?? 0).toDouble(),
      pressure: (main["pressure"] ?? 0).toDouble(),
      humidity: (main["humidity"] ?? 0).toDouble(),
      tempMax: (main["temp_max"] ?? 0).toDouble(),
      tempMin: (main["temp_min"] ?? 0).toDouble(),
    );
  }
}
