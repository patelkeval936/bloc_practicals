class WeatherModel {
  WeatherModel({
    required this.main,
    required this.temp,
    required this.name,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    // ignore: avoid_dynamic_calls
    main: json['weather'][0]['main'] as String,
    // ignore: avoid_dynamic_calls
    temp: (json['main']['temp'] as num).toDouble(),
    name: json['name'] as String,
  );
  String main;
  double temp;
  String name;
}
