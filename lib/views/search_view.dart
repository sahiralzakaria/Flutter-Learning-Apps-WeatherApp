import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search city',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weatherModel = await WeatherService(
                Dio(),
              ).getCurrentWeather(cityName: value);

              Navigator.pop(context, weatherModel);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 10,
              ),
              labelText: 'Search',
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
