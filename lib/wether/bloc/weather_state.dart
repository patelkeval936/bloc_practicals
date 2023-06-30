
import 'package:bloc_practicals/wether/wether_model.dart';

class WeatherState{}

class WeatherInitState extends WeatherState{}

class WeatherLoadingState extends WeatherState{}

class WeatherSuccessState extends WeatherState{
  WeatherSuccessState({required this.weatherInfo});
  WeatherModel weatherInfo;
}

class WeatherErrorState extends WeatherState{
  WeatherErrorState(this.errorMessage);
  final String errorMessage;
}