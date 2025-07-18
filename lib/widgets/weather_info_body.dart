import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(weatherModel.cityName, style: TextStyle(fontSize: 24)),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network('https:${weatherModel.image!}'),
,
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp: ${weatherModel.maxTemp}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MinTemp: ${weatherModel.mintemp}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
