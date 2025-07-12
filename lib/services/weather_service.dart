import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService({required this.dio});

  final String domain = 'api.weatherapi.com';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response = await dio.get(
      'https://$domain/v1/forecast.json?key=0c27cb6013fe478c8fe132837251107&q=$cityName&days=1',
    );

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);

    return weatherModel;
  }
}
