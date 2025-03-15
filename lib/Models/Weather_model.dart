import 'package:flutter/material.dart';

class WeatherModel {
  String? localTime;
  double? temp;
  String? stateWeather;
  int humidity;
  double wind;
  int dailyChanceOfRain;
  double tempForday1;
  String StateForDay1;
  double tempForday2;
  String StateForDay2;

  double maxTemp;
  double minTemp;

  WeatherModel({
    required this.localTime,
    required this.dailyChanceOfRain,
    required this.humidity,
    required this.stateWeather,
    required this.temp,
    required this.tempForday1,
    required this.tempForday2,
    required this.wind,
    required this.maxTemp,
    required this.minTemp,
    required this.StateForDay1,
    required this.StateForDay2,
  });

  factory WeatherModel.fromJosn(dynamic data) {
    var josnData = data['forecast']['forecastday'];
    var josninf = data['current']['temp_c'];
    return WeatherModel(
      temp: josninf,
      humidity: data['current']['humidity'],
      localTime: data['location']['localtime'],
      stateWeather: data['current']['condition']['text'],
      wind: josnData[0]['day']['maxwind_kph'],
      maxTemp: josnData[0]['day']['maxtemp_c'],
      minTemp: josnData[0]['day']['mintemp_c'],
      tempForday1: josnData[1]['day']['avgtemp_c'],
      StateForDay1: josnData[1]['day']['condition']['text'],
      tempForday2: josnData[2]['day']['avgtemp_c'],
      StateForDay2: josnData[2]['day']['condition']['text'],
      dailyChanceOfRain: josnData[0]['day']['daily_chance_of_rain'],
    );
  }
  @override
  String toString() {
    return '$tempForday1  \n $dailyChanceOfRain \n $humidity \n $localTime \n $maxTemp \n $minTemp \n $stateWeather';
  }

  String? getWeatherImage() {
    if (stateWeather == 'Clear' || stateWeather == 'Sunny') {
      return 'Assets/Images/Clear.png';
    } else if (stateWeather == 'Partly cloudy' || stateWeather == 'Cloudy') {
      return 'Assets/Images/weather-8820076-7139037.png';
    } else if (stateWeather == 'Moderate rain' ||
        stateWeather == 'Rain' ||
        stateWeather == 'Patchy light drizzle' ||
        stateWeather == 'Patchy rain nearbys') {
      return 'Assets/Images/Rain.png';
    } else if (stateWeather == 'Overcast' || stateWeather == 'Mist') {
      return 'Assets/Images/Windy.png';
    } else if (stateWeather == 'Light rain') {
      return 'Assets/Images/lightning.png';
    } else {
      return 'Assets/Images/Clear.png';
    }
  }

  String? getImageDays(int number) {
    String stateWeather;
    if (number == 1) {
      stateWeather = StateForDay1;
    } else if (number == 2) {
      stateWeather = StateForDay2;
    } else {
      stateWeather = '';
    }
    if (stateWeather == 'Clear' || stateWeather == 'Sunny') {
      return 'Assets/Images/Clear.png';
    } else if (stateWeather.contains('Cloudy') ||
        stateWeather.contains('cloudy')) {
      return 'Assets/Images/weather-8820076-7139037.png';
    } else if (stateWeather.contains('Light') ||
        stateWeather.contains('light')) {
      return 'Assets/Images/lightning.png';
    } else if (stateWeather.contains('Rain') || stateWeather.contains('rain')) {
      return 'Assets/Images/Rain.png';
    } else if (stateWeather == 'Overcast' ||
        stateWeather == 'Mist' ||
        stateWeather.contains('wind') ||
        stateWeather.contains('Wind')) {
      return 'Assets/Images/Windy.png';
    } else {
      return 'Assets/Images/Cloud.png';
    }
  }

  // MaterialColor getWeatherTheme() {
  //   if (stateWeather == 'Clear' || stateWeather == 'Sunny') {
  //     return Colors.yellow;
  //   } else if (stateWeather == 'Partly cloudy' || stateWeather == 'Cloudy') {
  //     return Colors.blue;
  //   } else if (stateWeather == 'Moderate rain' ||
  //       stateWeather == 'Rain' ||
  //       stateWeather == 'Patchy light drizzle' ||
  //       stateWeather == 'Patchy rain nearbys') {
  //     return Colors.blue;
  //   } else if (stateWeather == 'Overcast' || stateWeather == 'Mist') {
  //     return Colors.red;
  //   } else if (stateWeather == 'Light rain') {
  //     return Colors.grey;
  //   } else {
  //     return Colors.brown;
  //   }
  // }
}
