import 'dart:convert';
import 'dart:developer';
import 'package:bloc_practicals/wether/wether_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl =
    'https://api.openweathermap.org/data/2.5/weather?appid=ac3b032b6f155cf11ea0531573528379&units=metric';

class WeatherService {
  static Future<WeatherModel?> fetchWeather(String cityName) async {
    log('Fetching For City: $cityName', name: 'WeatherService');
    try {
      final response = await http.get(
        Uri.parse('$baseUrl&q=$cityName'),
      );
      final decoded = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        log('Response Fetched.', name: 'WeatherService');
        return WeatherModel.fromJson(decoded);
      } else {
        log('Failed to load weather', name: 'WeatherService');
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      log('Error: $e', name: 'WeatherService');
      throw Exception(e.toString());
    }
  }
}
