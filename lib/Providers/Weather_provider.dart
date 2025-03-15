import 'package:flutter/material.dart';
import 'package:weather_app/Models/Weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  String? cityname;
  WeatherModel? get weatherModel => _weatherModel;

  set weatherModel(WeatherModel? value) {
    _weatherModel = value;
    notifyListeners();
  }
}
