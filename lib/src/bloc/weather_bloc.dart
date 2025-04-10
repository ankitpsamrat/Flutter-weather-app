// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/utils/weather_model.dart';
import 'package:weather_app/src/utils/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {
    on<FetchWeather>(_onFetchWeather);
    on<ResetWeather>(_onResetWeather);
  }

  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherIsLoading());

    try {
      final WeatherModel weatherModel =
          await weatherRepo.getWeather(event.city);
      emit(WeatherIsLoaded(weatherModel));
    } catch (e) {
      emit(WeatherIsNotLoaded());
    }
  }

  void _onResetWeather(
    ResetWeather event,
    Emitter<WeatherState> emit,
  ) {
    emit(WeatherIsNotSearched());
  }
}
