import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          final themeColor = state is WeatherLoadedState
              ? getThemeColor(state.weatherModel.weatherCondition)
              : Colors.blue;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: themeColor,
              appBarTheme: AppBarTheme(backgroundColor: themeColor),
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  condition = condition.toLowerCase();

  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.cyan;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.grey;
    case 'patchy rain possible':
      return Colors.teal;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.blueGrey;
    case 'patchy freezing drizzle possible':
      return Colors.cyan;
    case 'thundery outbreaks possible':
      return Colors.deepOrange;
    case 'blowing snow':
      return Colors.indigo;
    case 'blizzard':
      return Colors.indigo;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.cyan;
    case 'patchy light drizzle':
      return Colors.teal;
    case 'light drizzle':
      return Colors.teal;
    case 'freezing drizzle':
      return Colors.cyan;
    case 'heavy freezing drizzle':
      return Colors.cyan;
    case 'patchy light rain':
      return Colors.teal;
    case 'light rain':
      return Colors.indigo;
    case 'moderate rain at times':
      return Colors.indigo;
    case 'moderate rain':
      return Colors.indigo;
    case 'heavy rain at times':
      return Colors.indigo;
    case 'heavy rain':
      return Colors.indigo;
    case 'light freezing rain':
      return Colors.cyan;
    case 'moderate or heavy freezing rain':
      return Colors.cyan;
    case 'light sleet':
      return Colors.blueGrey;
    case 'moderate or heavy sleet':
      return Colors.blueGrey;
    case 'patchy light snow':
      return Colors.lightBlue;
    case 'light snow':
      return Colors.lightBlue;
    case 'patchy moderate snow':
      return Colors.lightBlue;
    case 'moderate snow':
      return Colors.indigo;
    case 'patchy heavy snow':
      return Colors.indigo;
    case 'heavy snow':
      return Colors.indigo;
    case 'ice pellets':
      return Colors.cyan;
    case 'light rain shower':
      return Colors.indigo;
    case 'moderate or heavy rain shower':
      return Colors.indigo;
    case 'torrential rain shower':
      return Colors.deepPurple;
    case 'light sleet showers':
      return Colors.blueGrey;
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate or heavy snow showers':
      return Colors.indigo;
    case 'light showers of ice pellets':
      return Colors.cyan;
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'patchy light rain with thunder':
      return Colors.deepOrange;
    case 'moderate or heavy rain with thunder':
      return Colors.deepOrange;
    case 'patchy light snow with thunder':
      return Colors.purple;
    case 'moderate or heavy snow with thunder':
      return Colors.purple;
    default:
      return Colors.blue;
  }
}
