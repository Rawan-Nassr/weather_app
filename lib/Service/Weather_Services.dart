import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/Weather_model.dart';

class WeatherServices {
  String? BaseUri = 'http://api.weatherapi.com/v1';
  String? apiKey = 'a721c340b2e64db895e222734241109';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      Uri url =
          Uri.parse('$BaseUri/forecast.json?key=$apiKey&q=$cityName&days=4');

      http.Response response = await http.get(url);
      Map<String, dynamic> map = jsonDecode(response.body);
      weatherModel = WeatherModel.fromJosn(map);

      debugPrint('************${weatherModel.temp}');
      log(weatherModel.temp.toString());
    } on Exception catch (e) {
      print('wrong in class servirs');
    }
    return weatherModel;
  }
}
