
import 'package:bloc/bloc.dart';
import 'package:bloc_practicals/wether/bloc/weather_events.dart';
import 'package:bloc_practicals/wether/bloc/weather_state.dart';

import '../weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  WeatherBloc() : super(WeatherInitState()){
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
  }

  Future<void> _onFetchWeatherEvent(
      FetchWeatherEvent event,
      Emitter<WeatherState> emit,
      ) async {
    final city = event.city;
    emit(WeatherLoadingState());
    try {
      final weatherData = await WeatherService.fetchWeather(city);
      emit(WeatherSuccessState(weatherInfo: weatherData!));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }

}