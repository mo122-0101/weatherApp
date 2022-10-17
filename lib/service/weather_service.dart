import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '0b4819330d0446a89b8143352221210';
  Future<WeatherModel> getWeather({required String cityName}) async {
    //calling api
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    //decoding data
    Map<String, dynamic> data = jsonDecode(response.body);

     WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
