part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String city;

  const FetchWeather(this.city);

  @override
  List<Object> get props => [city];
}

class ResetWeather extends WeatherEvent {}
