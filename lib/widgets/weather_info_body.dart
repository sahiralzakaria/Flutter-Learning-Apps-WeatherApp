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
            Text('Updated at 23:17', style: TextStyle(fontSize: 24)),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/cloudy.png'),
                Text(
                  '17',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text('MaxTemp: 24', style: TextStyle(fontSize: 16)),
                    Text('MinTemp: 16', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              'Ligh Rain',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
