import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Components/Days_data.dart';
import 'package:weather_app/Models/DaysModel.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/Providers/Weather_provider.dart';
import 'package:weather_app/Screens/Search_page.dart';

WeatherModel? weatherData;

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  String? cityname;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherModel;
    cityname = Provider.of<WeatherProvider>(context).cityname;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff969df5),
          title: const Text(
            'Result Page',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Provider.of<WeatherProvider>(context).weatherModel == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '    There are no weather 😞',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '  start searching now 🔍',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )
            : SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cityname ?? 'city ',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Update : ${weatherData!.localTime}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      weatherData!.getWeatherImage()!,
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      '${weatherData?.temp} ْ',
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${weatherData?.stateWeather}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      // color: const Color.fromARGB(31, 80, 79, 79),
                      height: 100,
                      width: 370,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.water_drop,
                                size: 25,
                              ),
                              Icon(
                                Icons.cloud,
                                size: 25,
                              ),
                              Icon(
                                Icons.wind_power,
                                size: 25,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${weatherData?.humidity.toInt()} %',
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' ${weatherData?.dailyChanceOfRain.toInt()}%',
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '  ${weatherData?.wind.toInt()}km/H',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '  humidity',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '  daily_chance_of_rain',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '  Wind Speed ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                      height: 200,
                      width: 370,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return DaysData(
                            daysmodel: list[index],
                          );
                        },
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              ));
  }
}

List<Daysmodel> list = [
  Daysmodel(
      imagePath: '${weatherData!.getImageDays(1)}',
      stateweather: weatherData!.StateForDay1,
      temp: weatherData!.tempForday1,
      dayNumber: 1),
  Daysmodel(
      imagePath: '${weatherData!.getImageDays(2)}',
      stateweather: weatherData!.StateForDay2,
      temp: weatherData!.tempForday2,
      dayNumber: 2),
];
