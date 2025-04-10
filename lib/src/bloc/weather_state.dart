part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherIsLoaded(this.weatherModel);

  @override
  List<Object> get props => [weatherModel];
}

class WeatherIsNotLoaded extends WeatherState {}
