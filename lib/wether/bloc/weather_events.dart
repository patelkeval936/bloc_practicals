
class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {
  String city;
  FetchWeatherEvent(this.city);
}
