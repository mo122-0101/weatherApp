import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../provider/weather_provider.dart';
import '../service/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextField(
            onSubmitted: (data) async {
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName??'');
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}