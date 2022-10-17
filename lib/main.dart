// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherstate/pages/home_page.dart';
import 'package:weatherstate/provider/weather_provider.dart';

void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}