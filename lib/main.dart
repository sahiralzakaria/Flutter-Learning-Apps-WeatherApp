import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
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

      child: CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(
            context,
          ).weatherModel.weatherCondition,
        ),
      ),
      home: HomeView(),
    );
  }
}

MaterialColor getThemeColor(String condition) {
  condition = condition.toLowerCase();

  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.amber;
  } else if (condition.contains('cloud')) {
    return Colors.grey;
  } else if (condition.contains('mist') ||
      condition.contains('fog') ||
      condition.contains('overcast')) {
    return Colors.blueGrey;
  } else if (condition.contains('snow') ||
      condition.contains('blizzard') ||
      condition.contains('ice') ||
      condition.contains('freezing')) {
    return Colors.lightBlue;
  } else if (condition.contains('rain') ||
      condition.contains('drizzle') ||
      condition.contains('sleet') ||
      condition.contains('shower')) {
    return Colors.indigo;
  } else if (condition.contains('thunder')) {
    return Colors.deepPurple;
  }

  return Colors.blue;
}
