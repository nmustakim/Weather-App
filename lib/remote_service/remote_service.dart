import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/current_weather.dart';


class RemoteService{

  Future<CurrentWeather> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return CurrentWeather.fromJson(json);
  }




}