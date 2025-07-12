class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final String temp;
  final String maxTemp;
  final String mintemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.mintemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecastday'][0]['day']['condition']['text'],
      image: json['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
