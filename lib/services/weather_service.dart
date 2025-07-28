import 'package:dio/dio.dart';
import 'package:weatherapp/api.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String api = apikey;

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get('$api&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'OOPS there was an error , try later';

      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('OOPS there was an error , try later');
    }
  }
}
