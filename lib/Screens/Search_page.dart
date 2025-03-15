import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/Providers/Weather_provider.dart';
import 'package:weather_app/Service/Weather_Services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff969df5),
        title: const Text(
          'Search Page',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset('Assets/Images/city.png'),
          SizedBox(
            width: 350,
            child: TextField(
              onSubmitted: (data) async {
                cityName = data;
                WeatherModel? weatherData =
                    await WeatherServices().getWeather(cityName: cityName!);
                // print(weatherData);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherModel = weatherData;
                Provider.of<WeatherProvider>(context, listen: false).cityname =
                    cityName;
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
                label: Text(
                  'Search',
                ),
                hintStyle: TextStyle(color: Colors.black45),
                hintText: 'enter city name',
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
