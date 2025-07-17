import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
