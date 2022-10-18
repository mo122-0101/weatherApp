import 'package:flutter/material.dart';
class WeatherModel {
   final String cityName;
   DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String? weatherStateName;
  WeatherModel(

      {
        required this.cityName,
        required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
 factory WeatherModel.fromJson(dynamic data) {
    //zero for the first item in the list of map
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: data['location']['name'],
        date: DateTime.parse(data ['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName:jsonData['condition']['text']);
  }
  String getImage(){
   if(weatherStateName== 'Clear'|| weatherStateName == 'Light Cloud'){
     return 'assets/images/clear.png';
   }
   else if(weatherStateName == 'Sleet' || weatherStateName=='Snow'
       ||weatherStateName=='Hail'){
     return 'assets/images/snow.png';
   }
   else if(weatherStateName=='Heavy Cloud'){
     return 'assets/images/cloudy.png';
   }
   else if (weatherStateName=='Light Rain'||
   weatherStateName=='Heavy Rain'||
   weatherStateName=='Showers'){
     return 'assets/images/rainy.png';
   }
   else if (weatherStateName =='Thunderstorm'||
   weatherStateName=='Thunder'){
     return 'assets/images/thunderstorm.png';
   }
   else {
     return 'assets/images/clear.png';
   }
  }
  MaterialColor getThemeColor () {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    }
    else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow'
        || weatherStateName == 'Hail') {
      return Colors.blue;
    }
    else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    }
    else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    }
    else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.blue;
    }
    else {
      return Colors.orange;
    }
  }}
